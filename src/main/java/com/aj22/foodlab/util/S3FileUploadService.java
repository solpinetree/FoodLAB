package com.aj22.foodlab.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.Upload;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class S3FileUploadService {

    // 버킷 이름 동적 할당
    @Value("${cloud.aws.s3.bucket}") // application.properties 파일에 있는 값을 가져와 변수에 할당해주는 어노테이션
    private String bucket;

    // 버킷 주소 동적 할당
    @Value("${cloud.aws.s3.bucket.url}")
    private String defaultUrl;
    
    @Value("${cloud.aws.credentials.accessKey}")
    private String accessKey;
    
    @Value("${cloud.aws.credentials.secretKey}")
    private String secretKey;
    
    BasicAWSCredentials creds = new BasicAWSCredentials(accessKey, secretKey);
    AmazonS3 s3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(creds)).build();
    
    
//    private final AmazonS3Client amazonS3Client;
//
//    public S3FileUploadService(AmazonS3Client amazonS3Client) {
//        this.amazonS3Client = amazonS3Client;
//    }

    public String upload(MultipartFile uploadFile) throws IOException {
        String origName = uploadFile.getOriginalFilename();
        String url;
        try {
            // 확장자를 찾기 위한 코드
            final String ext = origName.substring(origName.lastIndexOf('.'));
            // 파일이름 암호화
            final String saveFileName = getUuid() + ext;
            // 파일 객체 생성
            // System.getProperty => 시스템 환경에 관한 정보를 얻을 수 있다. (user.dir = 현재 작업 디렉토리를 의미함)
            File file = new File(System.getProperty("user.dir") + saveFileName);
            // 파일 변환
            uploadFile.transferTo(file);
            // S3 파일 업로드
            uploadOnS3(saveFileName, file);
            // 주소 할당
            url = defaultUrl + saveFileName;
            // 파일 삭제
            file.delete();
        } catch (StringIndexOutOfBoundsException e) {
            url = null;
        }
        return url;
    }

    private static String getUuid() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    private void uploadOnS3(final String findName, final File file) {
        // AWS S3 전송 객체 생성
        final TransferManager transferManager = new TransferManager(this.s3Client);
        // 요청 객체 생성
        final PutObjectRequest request = new PutObjectRequest(bucket, findName, file);
        // 업로드 시도
        final Upload upload =  transferManager.upload(request);

        try {
            upload.waitForCompletion();
        } catch (AmazonClientException amazonClientException) {
            log.error(amazonClientException.getMessage());
        } catch (InterruptedException e) {
            log.error(e.getMessage());
        }
    }
}
