Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558616;
	b=Jo8GKq/HLzK5zn95GSq63V3w5BXkqg+O3k2KTS50BvN1inJzYeU6RM3WXpWL16lNpBgs
	 DBrpz/uyyW6e3f9bdIi/2TEh2Da3HMJSjLDo1Al3H9sHDqR/1Nq4s1+GLjwBvC6/ftdrB
	 j6vZcpgtnLAA2u6no/nOAGsA7L5RsPjHl0+5Ge5w1CjCjUfUEBZoFrxZIfJkvQA+OAIDu
	 +4hsv1CafYx+uMs7hRre5urZM1lZJgoa6gbAvxvd3t+kJOUoj+Q7ZLA8hecAJDWyXfR7b
	 NXGIcp3YFDtLmL0C/Ko7yYQHNldVC/kO1OsZa1QIkpSXO969O8e8Ns3rMyoYecHhoNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558616;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7eU+9UKpstYUUXcA0ZzkT/1ibGlLMaGdIyWkm2MNBlQ=;
	b=4qYooZFXtYtnmT11AYGOFS/XVYxTNqpmntKjCMgmR0Inb+k4Mpp15VCDpQFVn93huGjR
	 f4OIUyEb5H2gjBIJZy9F7IUTXxKS/2wSBNs62VtK7z4ThIu7mLh3UoiiNPOv+vCIGtrWD
	 g0dNsXBjIW7bJv4qWwXLkMEHzWSFp43YWXv7jj8/mvutQvdQIk1CviyMZ+YpEa2Cnb+Lw
	 Akn+DVdK8Sg6k/LpXvHHa5hdU7jbUD74Nt1FbYf/5pfVJVi86MsrC49jUrhcSX+EA46gY
	 Pd1mMTyGYELrFXTrvn53eDvRfJGe+Fj3unw5276q382FpavbgSibmD4yOso2zBah8fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h9hpyqMX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clbBynL1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21920606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21920606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h9hpyqMX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clbBynL1
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FE5V3906651
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7eU+9UKpstYUUXcA0ZzkT/
	1ibGlLMaGdIyWkm2MNBlQ=; b=h9hpyqMXMIde5aLNxYKXrZM4yuOzilQU3DH2a1
	6EFSwk8BRFLrb6GS8utgZCbKHz/J/qNvL7nreoOl37FSuQRVCaqVpUWsH8SlR5kI
	AR/wuhg7R8CccOpDcZSAPFjQk1i3Xnt/LOEaTiTo3xjAeLDhoT+Xo4XUyrnr361i
	qvJN2mzDFq/Ekgts2AD1TEO0U9Xjo2+bEUNviPmhbnZhETcj2Cpplb2NtLdmVtcu
	u3Ur5UW3e9FquocpbD4AVHtNqkx8LJ48Hj8bjCMIsABV5PhXuIW9CnKkRy4VqWxN
	GArZoUqcYwemiIaVfWGYmubfLEXLIHjWHXP78MfhjI6EYLsw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs017fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:56:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so1521111eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 21:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792558608; x=1793163408; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7eU+9UKpstYUUXcA0ZzkT/1ibGlLMaGdIyWkm2MNBlQ=;
        b=clbBynL1U88ui2CYGCj1ijRhexIWau5T+Gp30UH3eNOuVTtumMZV7hbGecjuTdBEWa
         ds0VFc4CWKjGo7dEm9vheuS1MIfoOWvZ6vEINUTbWWnhoVe2GP/pXny+H5TpDQm0fnqs
         KYLW83Az5e7LBzWqy11zFvueeA2pLvg7tMqhLFecQi+c+7msIKCaoEyxplAFzz58fMIb
         o8yNgPttCUPMwiOF8ggs27BWCK8oGyO2mL4V90VdgS+zY5rDm2JrT66QnC8mo9IVRiXw
         uu/MuQfh7BXANboqDZy+1pKs2RHfhlBunV/BLldYJzPcD+t8E0mzVCIUfaePWfNNhWBD
         9nGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792558608; x=1793163408;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7eU+9UKpstYUUXcA0ZzkT/1ibGlLMaGdIyWkm2MNBlQ=;
        b=bl6FH/HkvCwv7kcJeNLFbkcFgcuCQ1ZpUuMEzyDF/5G6ms20svVPt7sLWFrEbOfBuu
         3MIo69fbcG11gtMxFBtnqJ5R1pIcqtSDdhvZhx99S9fAz6ZYNl1EQh7cAw3rMdBS2sGj
         eQCDiickIXEuZiJLN09gHjUUKJQZ38cFt1+43d6uM/9HR4rGFwr2GZO3JnJwRiRiWdq9
         BNUprp+sxHc5h9eA4LBumAbCC+eyHs7SOj03uJQqqc3+HXzdwwESCM/N81UInf2XnZHL
         tyVNV/NmM4ONrF855dmiUu+0Cop7ZLzC7uxpGds3PS5p5ap7FIuGCUCxh0JzG7LJqwpR
         MrdQ==
X-Forwarded-Encrypted: i=1; AKwUvByO2vQr/Mpeu8eBm+G3qaGyOpfNvJRIw3ZD+FuwkXGn+1nNFHCH3y0GkZYDeYnpRK8sA5ib7sBhm4rtBXWG@vger.kernel.org
X-Gm-Message-State: AFq9FYIPKOYmBVZqWSz/XC7TArmnjv6L/FX5VJt8L00eWa3f5Xf8Ypem
	sUYJtsMVP5+Lqpybg5rru9WVg/5nuyjJteElCtgWWLc+OwjFY/5LUH0KKWur9/8FIwt3bNBiG5m
	MkW+2XHwu8XvPfwsvyLBvnnnuPzlX2Bgyh9YhA7KMgSrl/4Dz9gBB/XFISpI+almDJFh3
X-Gm-Gg: AYBFou2CowkuqHdGT0Q3PH7R7AcqWSbXJKaFLUdhg/fGXOiqWzs4Pfq6ge5Ia04UVJ8
	0GOX9QchYnAOyHXLOrswy6WcTreelZFS/Uqr1DE7AfYjCMqLjfIs91wfYghYTtqu0cBDg+KuCdM
	OCpjFcyhbVrCJVP26Iv40YHiEYefqJXtgNcx5m42ZgYhA4yQBPGToaDmTR9Cb5xbWGisBfCeCRk
	v/DrpapclOpJCh55T3F6lmEQeTytcWCiGX15ZRIwaQ1RH5Ig6GNMAL7Z8/dp7bDUG1VEgXNUrC1
	k9qVf0Mks1KgKml5hNh7CQhcSG0aCLXVJ9u9A5IMhb+nfai1jQwrSGPj7aexAC8zrnuVkgLfVJ0
	P+1tJuOIwCgfxjxsqxeVvne/iQB0Qulg=
X-Received: by 2002:a05:701a:c90a:b0:152:92c6:8b58 with SMTP id a92af1059eb24-190a6adaa1emr1087597c88.35.1792558607740;
        Tue, 20 Oct 2026 21:56:47 -0700 (PDT)
X-Received: by 2002:a05:701a:c90a:b0:152:92c6:8b58 with SMTP id a92af1059eb24-190a6adaa1emr1087567c88.35.1792558607170;
        Tue, 20 Oct 2026 21:56:47 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180adasm3149280c88.8.2026.10.20.21.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:56:46 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:26:41 +0530
Subject: [PATCH v2] arm64: dts: qcom: kaanapali: Add memory-region for
 audio PD
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
Message-Id: <20261021-knp-rh-v2-1-4e2f8e16b607@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAhG2GoC/2WMQQ7CIBBFr9LMWhoYrUpX3sN00eJUiBYqo0TTc
 HexWzc/eT8vbwGm6IihrRaIlBy74AvgpgJje38l4S6FASXupUYUNz+LaMUgtRw1GdUcEIo8Rxr
 dew2du8LW8TPEz9pN6vf+JZISSmwbQj0ouTtKfQrM9ePV302YproMdDnnLzIvTo2jAAAA
X-Change-ID: 20260922-knp-rh-b090f9ec1572
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792558602; l=1627;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=g7PmCw+MropldZsXCylYqSjzw6KcxByQJbN1pb6h64A=;
 b=0xXacu5E7uFMoh9mM6MSJbOYT6ty1oNvnKT8vUy+qPJHOcrgcESf6ys+BSbHv6HRsDNGTANUp
 Cdh8hsFnRR/C58/ED3GpJVJ/Z17lFpcJv1iydo/W4YrOyDJkMAX9etA
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad84610 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eaQUxe-TdNk2Jkw2ZF8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxOSBTYWx0ZWRfX6DBVFpIk1IH2
 /vOD1e+QzVvlT7UKwlv00tFzjow0MEND2zTK6ueunzIUmPB4ILVEeveUBkwPGthESC5PqX+6dhr
 yr5siDZjrq+9CreEA90z3hEOyJ9/ocvNylGz84zKDkGfpS95AyS6dm8i11vEQV7v+veO6q9hhBV
 R6D5xxlAHeNCP+3I8/CWgXhv0eS+87IyL7lVEWgVdcCK7csoSJzL7CB5l5VjVI4rDDmW4514Pgt
 QWuqyFrYQcsjPNLgH86AZRs2lXGSxjtNudBZ0mi0AUn018UhUh+p0j26rcna8nEc2ePsAjz5/cd
 Z9KsWt8ewNrMXsff72TIpm9939gxl37/zkJ6M/harqaWd0sygAGfutb3Irjv4+78zckzmuAo+Pp
 ToPdSCgUc7gdDbYN4K4rjp1DZ24KL4jcf7vqrUQGD9Bg7iucEGH1rKNIUuKEf7XBYP2ZlgXQORb
 oOoDh71vpokBIYmqsIA==
X-Proofpoint-ORIG-GUID: MF40fXDlMh4AT7gC56QQp815SkbCYuWI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxOSBTYWx0ZWRfX/gZACciLvHr1
 DbXUL7TnPOfBQdYhecihylLaumbcClAWpBmW/EJWaC0KySFa0qOYAWqEFmuZEzrXc4iNSZU8Cmb
 +sfrtEe2Y4PFm2ufqkd9pySGXw6AonM=
X-Proofpoint-GUID: MF40fXDlMh4AT7gC56QQp815SkbCYuWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210019

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v2:
- Make the audio PD remote heap no-map.
- Link to v1: https://lore.kernel.org/r/20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..8a1b53e9f73b 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -451,6 +451,14 @@ rmtfs_mem: rmtfs@d7c00000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			no-map;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -2755,6 +2763,9 @@ fastrpc {
 					compatible = "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-knp-rh-b090f9ec1572

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

