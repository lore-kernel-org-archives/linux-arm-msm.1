Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769106;
	b=EU3NnBf6Lx4SsiixRmYIslA4NDz8rc+ufrXvM8p+N3cJw+wjcE8eFe+ydTf1lt7bwowE
	 BA2SZ1Hl5m/roRNIajCMCyYRu9/ycGQzzRomxmNZlFDz4ENB6owSzwNHWWEorLohMhruq
	 SX4MlWCI6XCDe0WEc/t53DrR5dTFxE0t6JdigD6RP47CkZnI9HpBud3igthm0stwZPnWO
	 2N+HYavfEMW93N2+JeUPpgPiXUjvy9OZdMH/YkAXV0OfIy7URreaMqA7WEZsWauckJ9rM
	 cKH16FzvWElB33gnCmqx+QBfVMxTRYBv3jIGcs6TqhiL60eSPwNcQ0ynLd+6RoPad5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=klExsNggnTq7Co752110n/Fy9zdaNvu8vGyvObetxTY=;
	b=3GGsht2ftdoUJrpBP5AhjEulq3eMNgweJRcYa0ZjSRcgZ9rmSmEnvbJ54hllxC8tOCHQ
	 9l3G/HEFkP5MHNLDQiUmljeU3ygaheZK6gVAlayUbgp31Emigf+q8vihnD++MfHEfYTBZ
	 22MMLZtmAqz5cC1LPqVW2FqkloxZaa35GK61mehzcADCuJXe1jZ4xTIJ6jvRae2QskMnw
	 7T+wweQQoaedFpI/L7Ivnt+HMmmQakDGJMbFBJW5EcQ8u0jfRye8GGt/L6iBYxUjdvTGx
	 VgfKigy82J6s4b7p+ToVnEcMTHonHmTYMeWLdZw4WIioC47xXxyy0o3O6brlJVsgDJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1psPBNl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DBJ9hS9C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084F5606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084F5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1psPBNl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DBJ9hS9C
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GdSb3983882
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=klExsNggnTq7Co752110n/Fy9zdaNvu8vGy
	vObetxTY=; b=P1psPBNle7/D+Ji/MOwsEleepdJG5cR1THtHsXfi+8s/IOWQlBw
	BLUfaq4+yNURP51agqHX/C/5zSGaW1MeLPO59NUCyvmUH6i5QC9MgWunyegh9N5e
	ZEyvAIQdWtgKVNvVq56/Mg8u+66b6GjH7baCUSNxULOS2cClLqHKBK2ETD1cfrn7
	7GdLRhK7nt88w2w1g2VkbrO0Rd0SodsMB1sfp7lCim3MCFZKsGPKqnNe4DigbI5c
	IaQQ0n6vXJUV1xIybW01imyfuDI06oE45+i+FuNVfpuCZEq8aDGRy8KuZ3Q7HvYd
	jolAUtwTADq32TBeTf4TOxQJnB60sEqshSQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a3w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:45:05 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-85f37d25fa3so7040602a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 00:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769104; x=1796373904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=klExsNggnTq7Co752110n/Fy9zdaNvu8vGyvObetxTY=;
        b=DBJ9hS9Cl8BpJcNQ5/SvcBzaCYEc+8SjU0jitn1dfEFpzFZpOFmWQrSjEZDPgBDXeU
         vY3o6qdRpG4O2Ei4EswkjDu56Qlsu6jj7kiynVfvOCKJayvF4dVijTpTBqEGbd4liu6f
         sK7k44i3gCCdAxhMpK+LMFdWWKgS5SOYE3rdyBwRLQ1JqP6ZFhohIE1UmQSFOuQL0fWL
         N5WPpvbHndWW58prxmKmuUbcVyXo9jHjmIG8B3YxRnPjbKeoSD2LXdcd6Pc//QxwU87Q
         rUoWYoZuCJNoE7MaTCVEshKsH5QK5GFzn8U7Rp+9zkoDJbIl6KBFxHIHrlTChLUTuGO7
         B+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769104; x=1796373904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klExsNggnTq7Co752110n/Fy9zdaNvu8vGyvObetxTY=;
        b=WVL8mfE5DKadCEnX7vkQFwGuzWCAr614sK69aKdjyg1cjnOCahqrxwkkMFFXrGgD92
         MDRh91lHpGogbldvUJ7P5ggcKpDlohJmd7Ro77BLPGZtGNIBXdDMxFXKh7jElbNJy8hQ
         HPI/N1ksWzfqJATSMGknSv05e2AmB8iDyFqaKFrdS+NJ13hx0N9ZN2Qb0x67pW0103dz
         l4Ge9SYJNLq+W130u/l0bZdL1N4bTvRGCchA3u8Q61wOMuzJH/RBZ4oHWwno5E85+eM2
         lcP1Sm1IZd54slRdXvUk9jLeNrZ2ONrP/WguQuS3K2Fo7N2JzL5Ao1Bfhw4JRLDkJXV2
         DuMA==
X-Forwarded-Encrypted: i=1; AL+hErEBC6f903Ei2D3KcSJn8P6P5vUBu6LRpMhWZJeF8+y4RPFOTEhWgEuH2Qy+0JLPUU7EXOuLKnDO+gKj810P@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ae3On5LUmKW/gqgiAKejkhrDaIo9YitmODNBEeag1Nrug8gZc
	6IygZlWFyLcuJ4DEijRQQJ7pJ2n8SD6EwhPJNn83BIlNEX7Va5ezU0J5BCOXR7ZWmQsSgpb5nJ4
	/FKtOyrwntTUwGchpJa6sZAiZGQTPej8cxs2Scfs7iEuGG7Nc/T77Su1/PLJipIbgGR41KEGIV2
	wbsVA=
X-Gm-Gg: AZFdTZes9mAZwiJTVhtdg6bURz9GUAZmw5lOh8u7hGN4EgyXUqnly3RYpkLW7GqGDan
	YVeJvl7RXF83hvJ6E5D4WmlIHIbsxVSyqHRjnCH9oJTQMhINSVsl3DUNbDlAk6xc2WfeR4ph7Bn
	gbKRXX9hfLc5dkX0GpAiGbhYkrUjV242YF2u5RBucETVyaZt/G0ASQhRcMmi6VhZvFm340/H+i6
	F/pxdQ7twFwakHrw8COyMOfcBWvPsgVLE3WPvZTAQLCb/AbR+W7+6IWrXW1S5l1GOjMn60Mgakv
	Tko+9HGJ+4EguAPK2qG4C/DwdC9ps9GxChwzxGTYd/IMIISy19CaqyDCJ4cf0PwVvN2jAKcMXyp
	10NbjcKcVTzV+wow+XjSZP+T7gvr2ifZcpuitK55QiEICXucLeGUceD37NAPmksLmTe3n+g7b4d
	WEF2qvpC7wzZxCJdBKRpaNjDzhqjXs2OZ4rYTF
X-Received: by 2002:a05:6830:4c18:b0:81f:22fd:6ed5 with SMTP id 46e09a7af769-863159b9da6mr27289252a34.21.1795769104223;
        Fri, 27 Nov 2026 00:45:04 -0800 (PST)
X-Received: by 2002:a05:6830:4c18:b0:81f:22fd:6ed5 with SMTP id 46e09a7af769-863159b9da6mr27289225a34.21.1795769103634;
        Fri, 27 Nov 2026 00:45:03 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6d8sm16468518a34.10.2026.11.27.00.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:45:03 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org,
        konrad.dybcio@oss.qualcomm.com, abelvesa@kernel.org
Cc: sibi.sankar@oss.qualcomm.com, konradybcio@kernel.org,
        rajendra.nayak@oss.qualcomm.com, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom_sysmon: Free shutdown-ack IRQ before freeing sysmon
Date: Fri, 27 Nov 2026 00:44:49 -0800
Message-Id: <20261127084449.2029868-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gnxH3tEHiPN7hJzXDdyR6lOpvPpWk2Tc
X-Proofpoint-ORIG-GUID: gnxH3tEHiPN7hJzXDdyR6lOpvPpWk2Tc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX/btCtWxVXKeQ
 NRI9tmqVP8uwYweJcXUM3qerHDCrt+4yplhLfLXhsZHl2hleJpvNaWoadnLW40HQkojJqaiZAOS
 TIgI3mFXarNp3xqgiEl+hMjS5UMgOc4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX0N/HnmbPJqTq
 NHwAzhZ4q87LEm1rklD9AJ0eYF9IpLUc7pX5IakvdfTr2qhHoCMCWVsPh7WehrBFtgkK06lOVRx
 WNl6TeVbdhNa80NfpUkv3/ocYZ2rY/8ZOaojokdcA3MBOtJdU+qFVPw0eOIpxynkwYno2SjVcsM
 GO+VmAq1oVIu+rwxfSiAnPkpBVposB3itrXrItIKjs7TUP+hISRDEsFN6uNrefbrdp1CQL6WIyh
 eZ4wR1q8qyYMrmV2f3RNw0eVICRqBmqXQnZaBeNvW3L6FGS6my3mMQH8TrL/qQaPR0jV9SAl+03
 ldZ7uPpq+1hGUcQYwIz4hgDJDTU38R89y8Taw8Q5cbUMXb9d481SnGzu3dRLF+fr+obALcwMxoF
 1GENBYYJbMCK9hw/xshZxqk+M0ccBEMX07ux29WGlyd1GqY7R5lkeMsxOrueP5ti8Qzm9EusiJK
 9K2Dcewh4gc1hoG2BFQ==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b094311 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mRnBLr89bJbyuihAmEYA:9 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

qcom_add_sysmon_subdev() requests the shutdown-ack interrupt with
devm_request_threaded_irq() and passes the sysmon context as the handler
data, but the context itself is released with a plain kfree() from
qcom_remove_sysmon_subdev() and from the qmi_handle_init() error path.

A devm managed interrupt stays requested until the driver core releases
the device resources, which happens after remove(). If the remote
processor raises the shutdown-ack interrupt in that window,
sysmon_shutdown_interrupt() runs on freed memory.

Free the interrupt explicitly before freeing the context in both places.

Fixes: 027045a6e2b7 ("remoteproc: qcom: Add shutdown-ack irq")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 61e1038328e8..0ffa6edaae9b 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -671,6 +671,8 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 			      qmi_indication_handler);
 	if (ret < 0) {
 		dev_err(sysmon->dev, "failed to initialize qmi handle\n");
+		if (sysmon->shutdown_irq > 0)
+			devm_free_irq(sysmon->dev, sysmon->shutdown_irq, sysmon);
 		kfree(sysmon);
 		return ERR_PTR(ret);
 	}
@@ -714,6 +716,9 @@ void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon)
 
 	qmi_handle_release(&sysmon->qmi);
 
+	if (sysmon->shutdown_irq > 0)
+		devm_free_irq(sysmon->dev, sysmon->shutdown_irq, sysmon);
+
 	kfree(sysmon);
 }
 EXPORT_SYMBOL_GPL(qcom_remove_sysmon_subdev);
-- 
2.34.1

