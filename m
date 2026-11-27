Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762275;
	b=LABR4Yg/PVGXmbl6VwyhCTJJU9PB8jOLBZtPdRolHkOQryC1Hy46Utzx63o63lv9Q/nY
	 zfBZEyFiR+Y6D7l6KgE5HEXSClQlaQrdaoyoGLwUocZcLAh52C91Q+4kVJOhlULymeKUR
	 sEEng/eHkVVlRHiHMyr5CYdAkSjVn1q7m6ri6ap1Kx9Uw8uA7KLUGq8uAZQR5aQLhPYMC
	 eWcBIqjZ9q4CuqY5wT1O/UN8cMxb9ShZA1fEq5eoMHKXmM7C/11ks/OSelQyGYIPOzbuP
	 chFTLngdtHhtIoW6AMxbz0DLKHxtAFvyQHR1JTSjDDq51h1z+ykpEGMvNV4Y5nkPqoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=93elb3xRtMO610ZGRWePKoBm994D3H+u4IAh7LEGIKU=;
	b=4nBzuabK99PKra3It7z2P2kK5mX1WPXD3CwwjspCLDnaR1GJvSTA4nH52JlxMrHu9fMn
	 rs6Wn8gI9bQeeAPAMv56LYmnR7fT2P6reD9BK9l3j9HjXwiCI8KjVxFxMwLXd0XUCaWC7
	 4PYG8VfVMgB2ZHLnHJ1hs+nlmfcVKUo4bGzA+qcSrYCo1gYUBHomFsYageLJhPlkXHscD
	 PI7rzWrOmn99BDlADLuTihw8AwWGPgnNpEHLVMqFedbxWexBD78GVmaVRwA8iFYXsNeAZ
	 1NtALfu3DHNBDKHZKglwaLxQSO0bbmfGrS8IRrXUQ/LCvXyLg/7jnZuYMNBk3qZMqKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iBi0Sp0G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evZ6B6Hx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CF8606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05CF8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iBi0Sp0G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evZ6B6Hx
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR6VgA23864273
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=93elb3xRtMO610ZGRWePKoBm994D3H+u4IA
	h7LEGIKU=; b=iBi0Sp0Gsr4An6gp/iWBUXnCxDAr/7GUGJvzvUrxIUmueB4XteZ
	zNVaFTzaLiTdQFdFmKTgKYU0+J0I+JbEW28R1jv2oG/g+Ya/LN2dyfICWu/DR+iy
	my/1hSw2Yz/fkN70IdMfK2sCzak643Zv8+NKoOC85upVG1L3moeAY2W2BzvLo+DN
	mpMouje0O6PLZG4Nl5i3lQClmS9mMm9cNAv9Aoi1ZQ4aFVBITo3YRFCWl+5+k+Tu
	RpZz3aLUlHbu75e86+dRhsEb6IUVBmBce2hG7G7mDuIDrFOIWzievsBkQU5cbWQQ
	fMNedp7NM11UFgABFWAPn4jcc1TJrbGPadQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55skeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:51:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so4785718c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 22:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795762272; x=1796367072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=93elb3xRtMO610ZGRWePKoBm994D3H+u4IAh7LEGIKU=;
        b=evZ6B6HxvVKi6WA1kbbKHuhI0PArMkk8qPogkCO/pJW0ShvCOj+7BT9MNjz5EqSA02
         OKm+9kL2V18dTtFe4Isy39B79EGs1H5mLh4eP2IfZHt6zIq2Lk1jxU98+eGgRFwEzMEJ
         k2aNzvUUn2duNBYCCYOP7z0GuV4V8B4COxSzOgsgbzQES53a9ttdzSaJ9xvmtApzHjHV
         o4/ZX2N/nwYABMOckazUI9XtnRsgWKq96v7plG/1xVqithlHW6VM4Fz+qBbp7iN5TIX3
         RJm6UdbCz+T2wp233zmceMZwgLGoh+pfx71M0/8XyDc+Ox8LNxg73SlMxrzhD6RFzuv+
         XEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762272; x=1796367072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93elb3xRtMO610ZGRWePKoBm994D3H+u4IAh7LEGIKU=;
        b=HDLNdu8Mk5Coh+LcejCyBYxrUdqHqLUh90RrfnQZP/VBoLiROwxB3hQu2PjPwzEkIB
         eNysNurJcSRZp0wEsZtaJz5HJJarFnVMgnCqQ1ISgtaWS480mdwpPLOr+3td6Bl3ngTZ
         NnHcJOd24VSBfq+ukdEuch1NoBU6UE4j2e9HghQNoqdqMsVeuH73NPaSqf3JAF4nW5zC
         YZbNGNhXPspHXmI5JxbREkU0TupiApdLU0Q8HZKHFmCT5/LRgVf/J/3nXY2bozDL4hLg
         syyfpcm3seC7W9u09AKFTtE5qK+WilLgNy86Gv02I0xQkDn3zxzp9mjy9UWvulzyEK57
         NrjQ==
X-Forwarded-Encrypted: i=1; AL+hErEpT7CS66I+mEM34jSLhCp5454tHTZd0ovSUcWPDscEUDYtIlFloI7tppNzLK1cnIJZUbw7rVRnfWpnnqFe@vger.kernel.org
X-Gm-Message-State: APuU4Z/6a32usDwu45vouvejD/6wChfGUnwnRr0JsL7sX+/1jcJHsaBm
	4fLCTYzM6gWBriRIwe03qk6CSvGAE1d/7cdxGhHe1QjX7fryYMA4ue0TE2jkzX4iZ/RqJBygd+S
	OOr/lk6C4xuNONzV4PcxzYp3jjzpdbZAd7X9Xfjmg2mxVCJmfpHhm0YUnAhf/itRX5/oKvObDmi
	5PQOM=
X-Gm-Gg: AZFdTZdBJZdIoZ6w6llRVmyf6mIjnUXuCZY+mv6Z6HZlb3z2nPRIhjkT5Wwzxz1xo6j
	VziXBCQtiIbCjrLtCo20x39id9jAFLk+ahL+rZ5zDz1Mm56v9JO0bU68v7c4o51/ECvBzJifF0x
	dRPOacLz+YHBlDtSbC0eYYemsYhNu8d5f4itjKX40OhvOS171VwlN05F0F1Zdljtv5Mnp2La/Uy
	MPDzDQXmSxgMPcgH/dAEFV57JpKAI7hkeMTpVcTnHSyl/wyb8YYP2GH4M6zEcgfXR6QUul3VN8B
	ypTT5I/pVyph+vCd+15gk//5CnjH7K8wiRX1FwN5msZODkVjfyEg3EYhrmnCAukXRDow+dIhOFo
	5oFiS1dp1ft7LfwTAQjjiEZF7UxxAcCC/eOmw4jgNAhHeA+qZ/Tpk1eaNaz/Je5MoByR6n0OTgR
	PlNZtsjVUB4EVbXlBNjmY+855R+M8Z8/eltKCuWw==
X-Received: by 2002:a05:7023:a41:b0:1b5:4b48:b9ee with SMTP id a92af1059eb24-1b5568c0ec9mr22808561c88.26.1795762271781;
        Thu, 26 Nov 2026 22:51:11 -0800 (PST)
X-Received: by 2002:a05:7023:a41:b0:1b5:4b48:b9ee with SMTP id a92af1059eb24-1b5568c0ec9mr22808542c88.26.1795762271317;
        Thu, 26 Nov 2026 22:51:11 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm53062320c88.15.2026.11.26.22.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:51:10 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        djakov@kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom: q6v5: Put QMP handle on interconnect failure
Date: Thu, 26 Nov 2026 22:49:56 -0800
Message-Id: <20261127064956.1950950-1-gopikrishna.garmidi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNyBTYWx0ZWRfXw/xpRt/zeiKg
 v5ipeQphpg+5k5bfHm0Ok+uRM93g8jfapX5nafEOMIwhL5B4rsUxBDxjfre6iaaqBv0X3xY8GEy
 KQwvB9iyOAEmbmgHOMJLQExRp6z+sxo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNyBTYWx0ZWRfX6APl2/rtEBG+
 EPMw6/DP9M5cfzixKF9KROStCKBNfQ7Fk+OevFq758CwnZyB3q6TAhgIDWSTXYZMxTYCaRFAAPv
 TJypi/SqeErUFaBZNmo1pITQsucdDR7nMg63Kk0bIIEB9l0nJAei2t27HmfYksE47MJyMlAy99u
 8r58DpqM3qFiFeRx9a0fuOQdS9AtKbBTbnD1yPMBQSX0vOkiwLqkJQLZVVR8dS4iNUA7/txK1ba
 I+MryRTsuG9tF74dL5JMFtWFdK1cgOtG+v4dJUs+l/+UTuLxRnk3bNq63OzcbatxIzCVO7tKpAu
 S2RsECABqClJQy1vgbl1Hj1xAjtLtRA5jx+VOvhwjBLMleGzkh4VbXjoDWCcko/fX3dizPJjGuH
 tv2x7T5A3qet31CQRCcZxye1wwoc4mU+N7UoE7iSnBQv5W54ebSIU5oq3huyONm37CVJYtgwzn+
 b+3k+HXDZCXztEq95lQ==
X-Proofpoint-ORIG-GUID: WTeE5P6UK_nxlc0BIeUXdrsCNKaqpuJq
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b092860 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Z9qQhxQJoVFeEDvJFE4A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: WTeE5P6UK_nxlc0BIeUXdrsCNKaqpuJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270027

qcom_q6v5_init() takes a reference on the AOSS QMP device with
qmp_get() and drops it on the load state error path, but not when
devm_of_icc_get() fails afterwards. The callers don't call
qcom_q6v5_deinit() when init fails, so the reference is leaked.

Since the interconnect provider may not be ready yet, -EPROBE_DEFER is a
likely trigger and the reference is leaked on every deferred probe.

Drop the QMP reference before returning the error.

Fixes: 8d9be5c6bdcd ("remoteproc: qcom: q6v5: Add interconnect path proxy vote")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index fe148b4b3775..71b79ab827e6 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -372,9 +372,11 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	}
 
 	q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
-	if (IS_ERR(q6v5->path))
+	if (IS_ERR(q6v5->path)) {
+		qmp_put(q6v5->qmp);
 		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
 				     "failed to acquire interconnect path\n");
+	}
 
 	return 0;
 }
-- 
2.34.1

