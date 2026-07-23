Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9433F5BC5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784795222; cv=none; b=ld+uSkBr4S3pH57C0gv26YlXqJhWSyBtHqp8FzCNj04qTZajLc+POwcTjXyct5Uo9KciczumjFJ/d3Ycc4/+IMUjiJ0UYzNoTGtMaz+OaYMg2Ti1zMqX7Qfc4QH+C0zZSdwpe2q+C68ZFd5PY68fuGfxCLDz5z4d23GNwJe6yOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784795222; c=relaxed/simple;
	bh=KjZAmYYdX486FIyES0cXfj7PWztonIPwwITTJrvXDuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XOrU95H22DsN3ozgpyEne9R/BIHNIa4dTsBAyl0PZLXxfEbjmkUAe5yCF7g2UyTk2T1sZ+XIG70cFzUYibISz+GQDxZuRwxCfoPPP6otHK93BRgVgNpF/lD5OgQwmbJ6LCkFmTOBRcf0mShhdYv9HpckbMSsbymxj6nycOaJQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cL+D/3ol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nia6vTKL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cL+D/3ol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nia6vTKL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7jZrs2892878
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=; b=cL+D/3ol1lLjMbk/
	FzxumZv9LtPAVFkslL2zXUFdJ0qCzQ/bR3oGOlVZPj2RoyOjjFa6G+O3FniPitps
	vQ6oYK04/4/cKeSQ+aHvzjnKPH2w3vgvfvCpo5qdhq9oh43amvvLcJtVeSgu9NFr
	hfB7gF2xocgwYW1xZ543/bUjE6HmjSnxaEWtpp1MGRrsC3cn+NqjXRpIhQIxoE2t
	SDZwwQVRDAMdCMK2G9frE9YveUUm/z4uKuGMoqWDow3XNschIIcMwzWeAfQFKGaO
	aQFcvfXD0h8E9dMN2bxa9mPVnD5rdj+4qai5a5c41f3z4KZ9/g77nXNHicW29X5+
	WULW/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq84t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:26:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce870a060so10441555ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784795214; x=1785400014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=;
        b=Nia6vTKLXLW1E9j+BSsMA8cS63T/+l+px3lQoBdGtbybLQkR6scF9iPw3Z7MUxfDAf
         0qVsSt3VRIAiRMxr6bILfAFTssJ7ooX5aJcLiMwvonTdCexrXlbdyEu01vKXzvKJONvq
         M6ZhvB8u4Xd9UbYO7RAEm7Visw8vU12ZpMzaV3kyA4EUqAOvujOhylAcpFcE7B0m+8SR
         BPyEsxgT9AtCDfI81b3tWynaMqyjgEo/EMxaKJJkCiaFkQMlsSOhr+ZiKFDeEKHR7b6v
         GTpFcngTAGCFlIHzgQArerHo1dxJnwW54z4cetPwzsuyfskgP5DJaCtJmtgZTqTXtIyz
         m8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784795214; x=1785400014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=;
        b=RJqWDEQvVR7jpLmeK9PtxaSMnpGFepP/tnftjCNnCuAA5vCnxlB3tzx2MuYh+aF02f
         NUYAUD42eHyDzYSCG8Bdp/nKnox9RkPtmCqbWrRHTd8w0bFNhN4FuX0yiFGBzuYH5s3T
         7H0KZ44hnoc/LrX8zzHhOeAzcGBQGViU+rbFiNXyH7aFhErjI+MPHJTrt232xFioYeJY
         VXz9iZi6coLsUTFOoE7ACq3YVbBpmVpRPpplOJKXhkLApu0mOO+MHHi6/lXjt78vVLVE
         EnnF4NBM8kaRKFHzdg3aeDVCsqUAaWACyPr/bOEMbRhkAOcA5X8qbZ6UAPI+ca3CjtjC
         ki4A==
X-Gm-Message-State: AOJu0YwPtb2F4mSxKC0MMCD0E9xFbitZR+cufr48BH0LyyIDvX5Yz5Tb
	7KpoQC9rBm4JI4/6lU+k2RS/LSfFVUhz9HzWfg3LiIai1HN1rmA77DqVqlsNOIIyPz5I2tG612n
	s1Hf3p3mnIV7iBaM5f46rRdLZTUs/9oylw4N+f3RpoN7XHxZ0j6NRTlYTlWy1/BuftFui
X-Gm-Gg: AR+sD128utQ8N70wCbmeLo6jofLn2gavXr0YwdnoLzLwEpgkrNPolwYQyTAquPaU6Up
	EVG2AS+jshbC68UdMR4rbLck7WXsv3BkgjSG9GIkMspahgN9f8/J2pelwvUQObyJpk4O/j8ItOw
	41yRscG0GpXcYK4Q0XBzdsFGiwk0fPErYoXuOJt/4LnaAcvh8Vsvwr6d/WlVDlxNOlhyVlLmXn9
	ZAS3VHVl2STbNV/1HJ8fTegIu8OK5+oS8DEbdabvn8WGgmaj728wE9hvRxAIgBtzViA9BPSNT/2
	/M66iKTFLTVVMr6e7lxLTkCCcjueTZNNSwqxN35LCale+frTky30fJcPJgajg4kEMJd2mLOMHHZ
	fJZh0MqA5QkThu5DAJKLisrJeopdWjSn33KvmiH7thhoDPfuoruCrsIYaWDcuB6k=
X-Received: by 2002:a17:90a:fc4c:b0:381:cef1:11bb with SMTP id 98e67ed59e1d1-38ec6a48974mr1872371a91.22.1784795213975;
        Thu, 23 Jul 2026 01:26:53 -0700 (PDT)
X-Received: by 2002:a17:90a:fc4c:b0:381:cef1:11bb with SMTP id 98e67ed59e1d1-38ec6a48974mr1872357a91.22.1784795213488;
        Thu, 23 Jul 2026 01:26:53 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea598f67bsm1427988a91.3.2026.07.23.01.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 01:26:53 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:26:30 +0800
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-add-coresight-nodes-for-shikra-v5-1-fd5494471b36@oss.qualcomm.com>
References: <20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com>
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784795201; l=956;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=KjZAmYYdX486FIyES0cXfj7PWztonIPwwITTJrvXDuU=;
 b=TxKjQwwDs9O+H09f7qetw/BCCIiqpxd6Zi5xm1od/kvdiFHVGC1fwFaeEaQIyPKjcOBLZh2gj
 SVWRqEX8gUADZkvODfn7si8xRXRv8/poBhJLrokRP4sd3mtdFwfS1x0
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4NCBTYWx0ZWRfX6+ibko57fc7i
 3htsyns83tUwKPmHyMiiWYi+JqwqbLBJH9CsG0eyjvTcuM2JOlANOy6CCDUBs7oswEfDIGlQAfs
 o7YwZ4+8OEUehbaYg+v+sZndXJabULo=
X-Proofpoint-ORIG-GUID: DY8zwanTeTlgPXr21P31ccqlgO1zFxa0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4NCBTYWx0ZWRfX94S1zOFUWZSN
 gfW8KdythU1P4ywLkhdGymmzUkPkUDcu+14afS9w/sTkfjpqoKzwY04tbUfkgSCbpncLo+DjxBS
 b8d8jJt27i3b+YItAoTZtFaBtIsli/Cmme8/BiX84urTo8z9XQUzrpvBprXICN/sqvScO2xcTDa
 FgGGxkrGhpz0/XvbgTm4Rtz9xf+kNcGkzN5O/mQvP0tPrDYJFyD/mPZWvDMWFOa6wZRHR85krb0
 QZf5RdQT06iRFDtwVKo3YgjGObhm572pYao14ARg0XFyrvyn2tnckEeaJKVAdR03F5iA99WaNAF
 OZWxhon7Db/6mMjhg0UlX8pxDWcqop3+XILoUCmTKBHdmiUuLWABEiNHXg0RNv32Ql2M7YUugWp
 aV5tHYzEirYC7zo+nGHzn9j7654yrZI9SPCBA3Web8k475hTmmb6D+TnBo4HBTRkiaAlm7geoXb
 Eb1LZ/e5+oFz1ICM4Bg==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61d04e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BZKsYnZZkaJ4N7IUUl4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: DY8zwanTeTlgPXr21P31ccqlgO1zFxa0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230084

The CTCU device for the Shikra shares the same configurations as
SA8775p. Add a fallback to enable the CTCU for the Shikra to utilize
the compatible of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1

