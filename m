Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086430;
	b=tvKyRt5jqYA1L+a2WYfl8KvSR61SNKAv5P4c1syM3IUpQvcZ2xkMBTdX5NPN7QevP7X4
	 r120QgosR6VhucfdKiaD2lS1NOQouF5Ypa7trY5W8yVZhAG9XwWzKFARIkLC+dQunwi+F
	 W+0vYe9Qdu+cZIMz7rdgJzE4062OiwbLBJ6pC0pYEWWKMnJqlZOU4sgmE3R6p2RdP2kzp
	 Jh2Rxnsx8umCDuAjGjoyYoby6rOX0wWxIPNU6vQwPni0ZFFJ1kINXSV0dSo5SyonWDXGq
	 6chJGHVLGWVoZE0IF7qWOPortAT09YGfwaBxEOF3qoll2Sg6W24mXbja5dyQXbA/yfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Mydu7/v60eKg1fWnzz92JlLJTuRpZkA0odLBmNL740s=;
	b=42KcjBhj07NhQHRfWDSjNj5y4VYm09eopHtEnNbbPKxvd98eisvsbjnROxB51HNFsUym
	 U3y/YNZxwH59/JawQc9KRlPtq6vKqhME9jmtGFTHS10f0YbRCyfop6zvjsNylq6wXSEJQ
	 ycuBvkblqWiSHFrZbv6fYxAkOzhoaxN0CtdynQ8KbY9a9z7VQJRjd8K7gWa16TW5QH8Lq
	 d0RqjFCVj5lJvroOX7ufywDs6dlTUXHzIHRGKg8kEWJegKCTaRzlR8M4LyCD81BotYNU1
	 xuWQjPfeS3IAFBkcFzIUNGfjTM7pNbEe/2HD9hWoqIpvRRjiGsC+Q1WfMBPyLD0oMgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=puo2TPrO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ettIUmEW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26605606A338
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26605606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=puo2TPrO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ettIUmEW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R7IocJ1168973
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mydu7/v60eKg1fWnzz92JlLJTuRpZkA0odLBmNL740s=; b=puo2TPrO9ZnxtzoK
	480dMdguwbZGkc0BBkFiVPMPQYfqu52UY71Cq1vtN+82NXkd91t2OzBLToU5XlVV
	EkwexV9XX2Tb5hV+lupTVN7ReCio1QIIw6wiS9Tz5rE/7plqoFJ1IFOXAZO0100z
	nKgUq61jUv4IxK5QMFULHWsM0HjKzlhycZQVrNK9tY6BqHGnCeDLE/zVvcLbN3+P
	snIGjNI0uGz8W4omPJzGNRBmTdobp5/Qg58C9U8VspQ3gw4sRr7tAcct0qlxW/Ru
	yyuhOVvGNYKPbAYmgrNYNEw/r73lqNO+Si9VpjPU7WCLLNQSi+DqLWR4CwgKu0SD
	gs15Fw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5r1n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:33:49 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4a68926c8c4so4540330fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 00:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793086428; x=1793691228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mydu7/v60eKg1fWnzz92JlLJTuRpZkA0odLBmNL740s=;
        b=ettIUmEWqkItOi1TkFwZlAxKoR8K9W4GGwFGAGBq02rn/WTwuHL9WEuEP8fuuOnhSQ
         gy2+NHVoKC8qoI0kGux/m4wEQ1SD2gjo9LKcvTS49rJwhh0qBcLQzOqNCIgS9zCQ8Nc6
         L1Hs4Xof1jU7S2jrENx2Xsza7E3BYBfVk/rs4i0qFt9AiBVe09XLkoE9vDKLNstrvw3Q
         Tq5UQbQMw/Pp2FxbaADtGLHRhavOJBFvZKnDNPKHuytrKpxdBIjwUi2/xzxRog1KIW+f
         GXjxiZjeSj33LiHFFc4F7iD3nq1tjhCOW7kKgX7HWjeN3nahBkXoJDuDHUMSsudVXlTp
         ephg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086428; x=1793691228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mydu7/v60eKg1fWnzz92JlLJTuRpZkA0odLBmNL740s=;
        b=Ekrago03wFkyGethDeZaqknqcBAgG9vsEyB3oPB6aH0wvrQW60uTi4VARXLrvZJ0TH
         aFrAIlcqD6AMdSRCgBnP9U57+x6BlFe25qhaYYLsAAghTse6GPNDmV75Sh4YNeTxZMZ9
         zz+mTwZ0oJqt0PIEyVcsShNO2x8FS+O3igQVSCkCySvFdWHRSnl9pCspupuuuTH7XH+i
         qpjWn7/QrQ2I2azW3VcS1nzooChC8pwtLx13mJ3GT6tuihk/I5R1KVc/EFLi7QlDbyk8
         Pi2NxvQ6qn8p9UQzNP5AAaipZxxjSVE/tJsD1A2vhtn4zB/yVIx9k5oi8oIQmj9nA9m6
         Mt4w==
X-Forwarded-Encrypted: i=1; AKwUvBy9EmquehVox3yHvSn6bYq2znahcOFvYRe7z7MSe0ilJN4XGGeTIocSKhyc9NTw9CYLdM2j2yZ0oAdodD/K@vger.kernel.org
X-Gm-Message-State: AFq9FYJPgP4LQoIp8jUnyPbqS1QZk5eiF4Z/+bisHF2tydDAQMzixgFr
	MICuQdQ9LKjhrFfd05rnyYb7cexICiugfP+EeDEPXopaF/1pyzvVmuS6yqyzJfRQKb6SOROEdOB
	7+MQmY5m/vUJtuHXeZWcrRnhDdldOu8aSnZ4Aij6w/0f9Qu8WGI/5p1/yRSuOYDrYf06a
X-Gm-Gg: AYBFou2vBIf3l2mAmcQgllk0C/VS5X93+SLowdqROtGKvYnp+hxJFNyMVHpBcEteUqb
	1LSDfY/osdbiCa50lCCL3f9AfxRRvaSmLWeAUnkep8XsCLrsY/4ic/GCK4c3ovWBpx2JpWcjHRp
	BH3gBOs/rixgsqhmpqEWTWqHVbLX/pO9khEYXnE3RSu+hTy7wBzWhmlbVWMIv/EY05kSGX8/opZ
	7E6MNrzQtbWmKYL2JIjucuWgLriJX/7TvJkgdWFFjYpu8G2adjyp1ykRYC3Df7ZHloEYrDa5eSP
	9KTxhHFDvHDJdmfY58pk99Ygm3xdMKDJD0Ob3lpSYqsb5yzHKXzDGKemNgch0HcQw411kbu6Gvk
	1WWT/rumvPoTM/flbEaRSTxj7j4LalErihlFxfiagSVj8lfIw8Qhk6JKyVeQuSfEp
X-Received: by 2002:a05:6870:4690:b0:494:9254:5b75 with SMTP id 586e51a60fabf-4a83f492564mr5150372fac.27.1793086428366;
        Tue, 27 Oct 2026 00:33:48 -0700 (PDT)
X-Received: by 2002:a05:6870:4690:b0:494:9254:5b75 with SMTP id 586e51a60fabf-4a83f492564mr5150357fac.27.1793086427823;
        Tue, 27 Oct 2026 00:33:47 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm6181923fac.15.2026.10.27.00.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:33:47 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 00:33:34 -0700
Subject: [PATCH v2 2/3] firmware: qcom: scm: Allow QSEECOM on Surface
 Laptop 8th Edition
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-mahua-surface-laptop-v2-2-7dd903a12d22@oss.qualcomm.com>
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
In-Reply-To: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793086424; l=1019;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=wNF7GM+GdxYCWdEaZL6S2MWmKjl1DuHJFAVWJMyUK3A=;
 b=sxTRZvchOqzGOxsqy3rNazQ68L4xmxe7cYMXP6mqGCxVJZZZf3jH9mGgIdHDfyzrrjE8YaRCp
 f44seOeKIdYBmhty9RNSeORb6oMZxW+15uFCR15jjdom8aTM9iYNecp
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyOCBTYWx0ZWRfX9ynsk5mCNe+j
 7JCITesb2S10BGFwObaB7oeZsk4rWrPvDi43Z9kRmFPG8O6xptpVoxheg6rC4Ip7+hb2+krQjKs
 RCq8kPNKnaOuYEhgbBPCg2vVNoaIrGE=
X-Proofpoint-ORIG-GUID: 3HZM8IiG5SlBb2tKLMrcnUjfk5YUbzXV
X-Proofpoint-GUID: 3HZM8IiG5SlBb2tKLMrcnUjfk5YUbzXV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyOCBTYWx0ZWRfX9Haz4e9b8qxi
 53RTFZJeLf4ROV64YR81171evMEQX+Xdx1ctF/8AqjFI6svgo69iJUH7k/Ntgl7uLhZ7bysWAER
 NUE7DKMkP2hDyStAQfdL0ykuzSV9eN96vOcPFfx2Yn5M0nOWYwt8z6fyci4obqVUeaq5k25LHSy
 BdVXHnwKSrffY1tJJZxOfYKywVLBMwgR3NVI1UowbJ/4jJGXvGn8ALHkTa4xXUpBm7w+oP6Gcm6
 BLM3jTMOqcKDAsGSEbksepasOl3cI2sXiUCtaL80T4kJpEKadDK1+7BgPiHJ+VooUPjNLEyF5Kb
 slUvE8ZhsaSFzqNU4uKplhRXF+Nn3BS3ouGa4/n92yX2PXAuu6gdrLl5DIgpn3jjdjRdtylOXLy
 sEwaHKMiAu5eSOQS9Y090QbdZcC4kk7sHwgAtrJ1NPLzQZK77GjLaKSHxJ9EfpwkBr9+/rhX57T
 +ttI871a8RdUBd2yDXQ==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae053dd cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iOO-S4HMiWNIuKyz5uAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270028

Allow the use of QSEECOM on the Mahua-based Microsoft Surface Laptop
13.8" 8th Edition, giving access to the UEFI variables and the RTC
offset stored there.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..30d87fd939e8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2255,6 +2255,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,denali", },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
+	{ .compatible = "microsoft,surface-laptop-8-13p8", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,glymur-qcb" },
 	{ .compatible = "qcom,hamoa-iot-evk" },

-- 
2.34.1

