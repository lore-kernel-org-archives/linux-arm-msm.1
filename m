Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8758E48F03A
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628930; cv=none; b=sOovwuSErf1ItKRbGPZ2LZgPmBAOZpTJjbm2nDpEWQyahzn7ufNXoP8CvmHpGriV2cG9wchM/bYYdncH/Y0JrxSfEVC5w3eANVFhGW7Ue9yCauJ7veMpmMpEteCJKzGMzcfy9u6dmEZfHANkVKgSnUwF3HoCg+Z1iX0YN4XWWSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628930; c=relaxed/simple;
	bh=OED1Xg9S3SY51ta3t3mrt819UPQ3wW6IVv1lWH/7UEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V3kr3kD1Qht/5ZbcaalvRXdopH7Ag4g7+0R0M/o9pQbxLEziWICk+rJTktGPVYKsTvY0UARE8fS7PjQD+Lm3wkOrzaP3NEOZ7g84mKu0cXNV2k7MslrbMNZU0j9PXt7vdQEwhmB3Bckv6Quo/hSZm6vev6l7uyHty7+CfV2FAdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJsDnUwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHwPOUSW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJsDnUwm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHwPOUSW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H61YBh776798
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gYxybknD8fyl/ZIeJU/5fWIVVbydgp9JHWKqHgXGOx4=; b=dJsDnUwmZ6T+ylZW
	MnZ1y7IHLV6y9+rz3xQtFkPBkJNo1DE1wl2nviWAq5klmOKfvA9TEz/FjB94+SOw
	hfVmoIa0N4aEhtfF5Ecp+sFMN3dJjbivK2NYUGpW7W6eVHZ6Vuv4scbZ7mLoV2T3
	oYPejvfUOvHafio2YjPDlm+8V6rPcoKu9CTBptsygt0YWlqfAdSn2QauGyl+QM25
	XGLrwXd826ieySuDolaQ46gh4xOGmABPfqr150g8wpIMQ42TGVYuRDWHOdPHNE2U
	6/e7fYOlOtbfHTrB1QdkUm+Hsn2gEIF2peyBcYpE7T4GLtcXErb/xUe2zCnpflEI
	J70hoA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2uyn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:08:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1056144a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 00:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789628927; x=1790233727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gYxybknD8fyl/ZIeJU/5fWIVVbydgp9JHWKqHgXGOx4=;
        b=RHwPOUSWyX3XQy2/xnPT6MKRFGbY03xUFvXhmyu0+X3KkVfGy6KpPaHTOnD06gQ5HN
         JKu4Z1wOnNiLVIkfLdCQBpRjmKyCANcAYy8l/pj+iJ5wtTRcnUAZUMOKr96PRXJ+UHAh
         l/iTHKEHIBw0Ory7yHWBzcFp0bb7HhpVUJHcO9qg/OJW+Vln0Pv6W24bFjikmDReGayW
         vdWwX7l102gguOpqq+/6gAVumP3QMjAcS3czAw0sDni2BWGij05koAQBEG9BRBJPPNDR
         l1tY/n6aJRygKYmrGDjy+0tXpHpqJ/vkS2+1tw+ARH9cOUx4Bkx/ZM2aYuY8q/7vLA6c
         iiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628927; x=1790233727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYxybknD8fyl/ZIeJU/5fWIVVbydgp9JHWKqHgXGOx4=;
        b=tZp5LcCXesjVgaaLp5z7KWMiIvbr/bKDao36TGqV4JyjT3KNhG3L+w/3l57PRYiVLi
         cKY5UAimQdSkjed45ck1m2INr4ezecIIchhQ0DA94cnmeGSvUlgTzG8oyFMo1hmULP2e
         u8NpplTXzggSe6LcBL7t13q+dRidC8xXN4J7+mwACNp4AL354ohWaaN3BqbQj93FW3kS
         TQoTUpxm1rA4R/MKySP/vj/dSurZpHAF8iqHm11M12RVqtAvVbEOSz+/9VDN3PkRrQYh
         c+atq1fL1SUPU11zhex5ijh23hGlxzlo9/M5a6QgnXlX4FwoFoe7xHfsB0LwufzwDice
         GEaQ==
X-Forwarded-Encrypted: i=1; AKwUvBySyRIHxUBLw2ZIDSzSEhIMR5hC+wSxqI+IVX1DGjjJbq+oWvSgzwcbq44tjCQgbeXH9qLbBvv1FFZgcx/S@vger.kernel.org
X-Gm-Message-State: AFuF++lqjsCV7VQzXR3CmQsHqCqn8EmGVa54LYmxgVIVJV6Hq4aoFi2e
	UZfVHBp7hlwrNKUfMNeC8Cw6M49m5pUkErU7FQQHUw7ovRYcMY7gAC/oiSrQvUHFTCOCCmSA6Ut
	wnpMyI24yLj5ghVx4y7ho5BEuxIPuLOpwmQAyQBTtqnLIBGTZRafzBpc7tXPmtl2CnTnR
X-Gm-Gg: AYBFou1ZH/wcV5edcbpFLelNIrc6XGFjtM2reneuVxFp5anEzOlhy8f40LHBzknowFY
	V+9+wniIXtWb5RsDLspCLI7Lm8O7a7OJiBe2LoNC30WALV78/fXFn7pOd6+xfF3rdaBVlvauimo
	NjPKm+x3dL4kmgR28dtpu8taaKpt1rNlQ7/R/zxTgyuGY3aBzOJYlLTey7AfhHu46WWoMxNtsZg
	WO0CuKKY7a4yigPWMGSIWbgtcsl/PN9aK0l3fkOyOkUAkIJK0+fxIi/5QoaMzWd03tDRE+xNV1i
	yl8exEbgQlnOZ5z8OIeFw+2+HFIknGpYPD3GXX4NhaNt655KwxRyUROUfgRyRNlME9E+cJ0ILg6
	XUhqLvNgD1U6JAE01Z8zMKJYKctUNPpSf/2g=
X-Received: by 2002:a17:90b:5866:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e1e25a32fmr12976111a91.3.1789628927176;
        Thu, 17 Sep 2026 00:08:47 -0700 (PDT)
X-Received: by 2002:a17:90b:5866:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e1e25a32fmr12976047a91.3.1789628926542;
        Thu, 17 Sep 2026 00:08:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm13280835eec.15.2026.09.17.00.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:08:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 12:38:06 +0530
Subject: [PATCH v3 5/6] bus: mhi: host: Export mhi_read_reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-tsc_timesync-v3-5-6826d5d2d527@oss.qualcomm.com>
References: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
In-Reply-To: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789628904; l=768;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=OED1Xg9S3SY51ta3t3mrt819UPQ3wW6IVv1lWH/7UEk=;
 b=j6FqE8uIa9myda6e0cGJaEMyZV5FzuN+gNvRGsEJK2+iBFQtaMsERaolLY+L5XroL4jWTvl82
 pnUZEryBqnfAggYjQK3PyeHlbN+6jhhaD9e1BpY8eiIcZcSeTmvBpbW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX/xS2iV6X9ier
 wSe1AwTZC3F4Hcy3pHt7AcbyVmn85gPY3Jykr+Dp2YItPI6tKMcaw20VCQBNCyMMpHUMCcrapdE
 Ujy5TZEvCB+qxlY9dXdK9pUPy19v0O8=
X-Proofpoint-GUID: bRi_D5i0bFLq1GeNPCbbV-VDGka24XdR
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aab9200 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=V1CThsli6YUvQZXG0mQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: bRi_D5i0bFLq1GeNPCbbV-VDGka24XdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX4xlQkCTau3vE
 slA3mSSbDn2JWinQxU9e0IEo/0RVw6YcOlyQG6klkpzOZRc6F/hEklPRVyfFNrkSffpXjw41ZpF
 2TR9UJ/G1WO3c0T8Di+9q2JlVHkj4UsRT4yh0ZK0lE3dDVoxNKVIofOB09qgxwdSc1VJPbNElcz
 uplXaLLBPuftf/eKwchk/pLO/ypEpjH2jqHN76cWDcPdeZX0GAITWY8toFWNaUXml4CcQyCw0HK
 Z9xJNojT5k8vCNkF5pAK7Osfp2AmzyX8BNlXg76YaPY6AkgW4sjXcRrXXCQxLBxI2C1HjkL1VcT
 oPJs3VwrMgVMEahbKHcYnoMCtQO6lzcp5cOYWfqsHUWKJEXBgKgd4M9CWdB1yuMyl/QvKm5k+eJ
 aN9auEx8ZfUWlbCOlUM6Ts+z8Bq14AQCy7Teawzhb/WmqOodWcKJvQ+aA96eb6EO4/f2DYMZq1B
 z9hkKwRsI4191grDjwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170094

Export mhi_read_reg() so it can be called from other MHI bus modules
that are built separately from mhi.ko.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index bfeb5cf53448..1ca9f781bbdb 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -22,6 +22,7 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
 {
 	return mhi_cntrl->read_reg(mhi_cntrl, base + offset, out);
 }
+EXPORT_SYMBOL_GPL(mhi_read_reg);
 
 int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
 				    void __iomem *base, u32 offset,

-- 
2.34.1

