Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603729;
	b=DTKmNnNZTSfYFfRaZiTUDIJR9IDrinFp78y1gqvpSbRfUj+HhJyC6jL2WdoZL6bmd3PM
	 qrfVVxGglcu0i3n3roFOsAqmJprxUPP4BfsL1d1pyzJzQA0I/MYKJ63EKfiF0fCu7dOLi
	 saMJvxNhHhQhFtFx7X9BhKJboGktHZJ4L8J4Pj0n6gGMj1ZocQy04j+81HOCuHVktyGho
	 Ho7Db+M9j69c70uGwNaMWu6NghIPNktDeHSJHqeifVJZCkxrOkObppAKDsgV1lSk26iFY
	 Cdcz+aDFzhiWWK+0V1cmZ4464Zri5nHskAFIYiSLUxbYvMcCP8L9HQQom8EUIoIY6cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603729;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xMItVK0GNTCbTS7wNNLZ9LnzLA8lzBLhQMNHQ7KqQag=;
	b=hvrXEifGtF80W4wMj41vSW05szmBDp0q7GKIoXZCskquoUgD0QDRLwW2ReBTCpYYCWIb
	 GHTHJmyx9GZTtxA85qp8NW/wgHK+j2wtsBnCrJrf9jUOxAraFUtmz+KElcV00XfC17jVu
	 THHcziJMbImVZ+dlNyErb7i18c6ASS8uBWeMfreeA2zSqsacAdVwpSdcPH9nqFrhBA2aN
	 iLM3ImOw2/kyF16cG5tiLBwvVOd/eT2rJuwAp42JoOsx5A+fsrMm8uQS2n97I0SxM7NQm
	 DEJGLEyiHtMc/DJi0Uneht6U3R05uza0zxlRYqDbw5c+UVjrIqek9j7VcBhlviC5XfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lXzf2sWl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYcEk9C3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBA4606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CBA4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lXzf2sWl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYcEk9C3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU8vQ682549
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xMItVK0GNTCbTS7wNNLZ9L
	nzLA8lzBLhQMNHQ7KqQag=; b=lXzf2sWlF9yW8h/R6hYGvTTjP3iUWFtv3bf7Ke
	2vM9WEt14Z4b2yJEw8PBwx7U0yB0uGOs4QA4aOYleGhXy/WVhB4QgO0iD1BAEWBW
	YotZ2LV2/LP7z3Uj3nRoJYoOfmLxLNwaLDoqYZtasAD9oIHCDi4388U/n6VNPLIr
	Z59KAHv6ln2H8wwcPPjZzX7FmeMbSGWPAb72bFrhh0SLjrdvvNvsIsPssfgVKWfO
	oqKlDQbjlhR+jvcka69JUvUnDNl9kiKxqV/70FDFKgkpnq641cQnb5ShJS8JFoN5
	3+m8t8BjXGKdYKcUBfATDhHgOitc+x1zDoWGRIWoiuNSSnFg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vs494-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:28:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso1599832c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792603727; x=1793208527; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xMItVK0GNTCbTS7wNNLZ9LnzLA8lzBLhQMNHQ7KqQag=;
        b=cYcEk9C3HW17Nm4jnwQJDXsIHB/5tRALfGp2G8OH3g8olDWnn0ErpDB4yvCBPLsdgs
         kNwiKPMvK3aNgYM7NljQmQtwaGK6rk80bbmfOXipN+aE4rO/w28+DPBrYO/HY2h1A6tu
         lV0OhPi/LAayG43EUSc9q7yqCFDldpW/JJg2/HBtqesC5twSY+7hQv/Z9UHN36FtlD4b
         7RKROosHMLo0Dt42vdE7UdiRMZ1wLHzr3DZ0pcyiF+1Cc8PSdj+LEgKXVd+HIndycDjv
         HyhvQf9FL6EfsxV+eZeIUGdshJux5FDAcWA6U4PI15+KwZK4kZ2w4LqLla2QYAhD6oU4
         WtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603727; x=1793208527;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xMItVK0GNTCbTS7wNNLZ9LnzLA8lzBLhQMNHQ7KqQag=;
        b=EjCGlWLu/x1MuGlsUCLtYeVFazKvugfKbaz2clOi72STs2EFdCF8CdgBOz0/4Q9rJK
         KmmgWyrXCfKLOZ90lXIXevB5FFF8PZTO9RjtdbGg3KUpy2AM1kA6H0cVcbd/LAvsnonk
         9Owlfea7W6bmi09MTpsGPKTK3JKQcuPlIHLAH+KAfRgKZPnmm7TC80xPLKK6bio1Nupx
         9PjS/Ni1RZbqMLuQBMmwYDT9qTFtxt1KZtVd9boCMj8IMYCQeuNDlxrOKr8ZISnKcIwi
         ENJ8vTe/WAILDCHe7jbB0no+zETW3jXRJ6fLamsHjDBctT0wjwrwsD7SsmG3+5sjb3En
         rd3A==
X-Gm-Message-State: AFq9FYKpj5BctE5unvfYabZvYwciravIIWiLSMJf3xJpLdLwXQ64wFAv
	ZP62wnqi62bxHGpPJ/wkqxC5oAhk6DakQhXQfqrlhUwTUIMnJ89+f+1fLjlYHUz+BGDQo0VPipf
	0RGJ+W+ImwKXcMRM5JAwQPDSOCvRtG1ahDtfK2NP/OAG0bjBokLZkBw4O9Ido+ssRLbaY
X-Gm-Gg: AYBFou3CzI/HgACbBpPssY8Xh4xrImvrezhVCENWxYlAnVt8JvaJCHYFXX1vyLpknqr
	jAccKNSbPjjtxKI7eRDSmzGb3mL6hsVel6FrLctqXTZwB/s+i4b49c8hjtUn+9byfwz5K9U9CXA
	dPL6iitVX/dzoA4/U9sU/H4SqV89QvH8FTrRebHazQY0D/iqQDfACeHTkdb/9MyLSzy2I553/Yl
	qVxG5x5RQMRDcNkgJJU+Kfl9aEZDL3SSO5S0dzO1trJbTOtK+6/XsV/Jhyp2RItD6iqv3qfZX1B
	/aYCLze+di27HEujZWVNkAXDcuCpIUYCJK5EBrWd+iHxbMWMQ0Fmm35VRRJkgolfFU9NPq0FbWg
	OaTdsB2nob4g/zx6gByQns9cf7nAH8HSIIvc8/5J6U9AVGBuLm0MW9cEQbRISYN6BiBy3
X-Received: by 2002:a05:7022:387:b0:175:525c:90b4 with SMTP id a92af1059eb24-190a50ef799mr3709283c88.20.1792603726504;
        Wed, 21 Oct 2026 10:28:46 -0700 (PDT)
X-Received: by 2002:a05:7022:387:b0:175:525c:90b4 with SMTP id a92af1059eb24-190a50ef799mr3709235c88.20.1792603725903;
        Wed, 21 Oct 2026 10:28:45 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1902f96dc4bsm8528561c88.0.2026.10.21.10.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:28:45 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 22:58:37 +0530
Subject: [PATCH] arm64: dts: qcom: talos: Mark USB controllers as DMA
 coherent
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
Message-Id: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAET22GoC/yXMTQrCMBBA4auUWTvQGfwBryIu0mRiRzSRTFqE0
 rsb2+W3eG8Bk6JicO0WKDKraU4NdOjAjy49BDU0A/d8pp4Jq3tlw/B26PMoRVLFyQaMHC6ejo7
 pFKHFnyJRv9v4dt9t0/AUX/83WNcfVUu1o3oAAAA=
X-Change-ID: 20261021-talos-dma-coherent-usb-f2d7c14a215f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792603721; l=959;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=ETROyRThRqGdVF4MqJ6uGiPE5n9rvqkcDXa+DnHtkfI=;
 b=MF9aXAxKll2JXritzcmuL4OWujK7XURpVFZSngCES/Q0lAoQjs7TI6cPtM9TYqBZPQVv7ksKN
 NZxTeZaL3cBBRBujJS3iNdROnInd+scXzy3A0M2Pq26avexiCnwPczu
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: pLcoYvtRv4DlnRvA0cprRqsSYPnnjwQQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2OSBTYWx0ZWRfXxcdNUqfcz7LG
 7MozEUq2FEKBcEedrhCUWtHaok3JmaYAPLpq6hqswfcNLmPtvPPE35v9p5LKMM0+L1SZ13YNdGL
 1V54Ejh0xM//06ETJKcW4mlB99Hsgno=
X-Proofpoint-GUID: pLcoYvtRv4DlnRvA0cprRqsSYPnnjwQQ
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8f64f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2OSBTYWx0ZWRfX/XnHx89LwnMJ
 NYuLZ0svZjReIbSNMWxtRt+/ZcfroF1Dnx6+p+FSeaa1cY/VZXsr+pzl+06IA5eoWlK15D8yDw6
 3oxcJ7YqeCSUBt0tw83geICqxg/jack7uFvd4+Dmkyiu7gjlP5Dqrz3A53FPqysQXfXoS1bzrQ+
 S10cXgh0iFKofMrw6TUWYSCm0AcPD+VKyfGjpm3dBguj3uN1FhyywCqcw6z576vk91uF24lO3OH
 Gb6VVSQFxKfA359VDPjVIaCiaXPiG0XQVurC6BsAakN+G57xCWsk9CfFgs9prcsMhfBCC1IxZor
 s3xVCMY0EfmeWyv51Is2cTcasnhXqREyvGUsujQXeOks7CLlwss1a/PfGXBakU46Nyj8tNo4erc
 ezJhbYHEoMxK5Kmkyv9QihVY9hRcRSmnocKoCNrNQlplcerH+XurL/OFqatnlLTidU174HLtGIs
 OJOy1UH6Z4hnV9ll+mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210069

Both USB controllers on Talos are DMA coherent. Add property indicating
the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705..70b002d29ef2 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -5158,6 +5158,7 @@ usb_1: usb@a600000 {
 			snps,usb3_lpm_capable;
 
 			wakeup-source;
+			dma-coherent;
 
 			status = "disabled";
 		};
@@ -5214,6 +5215,7 @@ usb_2: usb@a800000 {
 
 			maximum-speed = "high-speed";
 			wakeup-source;
+			dma-coherent;
 
 			status = "disabled";
 		};

---
base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
change-id: 20261021-talos-dma-coherent-usb-f2d7c14a215f

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

