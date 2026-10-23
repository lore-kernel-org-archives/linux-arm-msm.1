Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746209;
	b=WoqRzo+WfJYrxYZ/wBMA73svYdD5ledD5bP4CawOfropoE99krfgSlfKVhyebwGLrLTe
	 TIferGdEz63PEG1DnCSaJvlD44NIfLYA37Ty+cxDWBugLb0Iq0m5afxUtigDLummFxfRs
	 SjnaCB4SUIAu66SCdAy/psei7TslXxIMEyQwMWkV2icUhxOwFNdpEJ/IIGmtuQEM1aRjU
	 y/XE0CmAZ03fN0mVy6NudxjtL6GTKV+TNbgTe9ZLTl4+kbyYh4shgf6LyqtCN/Dx20u9o
	 pROjKNVjrjthqyNNYgCC5ssrIoc/3vvm9bTTssCBuSuXnfB6RwdOL62xn/1EL67Bu6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746209;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jadIZSIrpTyEi91i+IYQ4URvG2pbKwAmmA1d2i8PeOI=;
	b=oVvOJGPHtnc4hFe5rH+443BebYu+2meOd3QfrWJCixjwTVdfKWWwkc+wSfGc63EYIoSA
	 Hfv0JfFSNiIHFfq8mb0brhH+xHSBCDNuYUS15rLkBDz3xx+N9E9nl8szMEZuvmnxBAXEc
	 yrIFQ84BtCL8n4W3b26qWaZLU+Fw6W/R17ltfTlJR1ZN2YsBrq72tpaP07Mkz5qHgMmva
	 rBYRP4o2MIbGD7Rh6s2kWnC/XAkW0briQgdSqFAyJXNWAyhb10F+RFvwHoUPZvuVqdX85
	 ml606TkOWNGsCS4kmjcX1ex/LgTRGdCBQUD+mWyaWPQuP/amoBwT0AAQhtSIV5f7pVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOklABr0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MfsPAIUP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF14606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF14606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOklABr0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MfsPAIUP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F8D42112106
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jadIZSIrpTy
	Ei91i+IYQ4URvG2pbKwAmmA1d2i8PeOI=; b=XOklABr0j/NFfZ+wWinWrioG811
	NY0GoQIS8QewX95BcHrRB277F9Ls2y/Afkk0Mg59eD+Fxx3+sMbVgOi6JOYOMLGy
	vlXQ1/ApH8jdEP9uqfrr0rDuVokjbuTcVYPIZR0eyEmusNMsN0hdHHbouZys9poo
	jWI9YRxMhXKbgIH+crOstxic8+JjN+uNmuTyRMVjcR+9U+zWdVhoQ4xJ+v2jeVR6
	MBa/TldiHqT5G7Bv+9zFkB/uhyWp+z2qg5Z/IP1z49sHlO/cqw3CkH/QNiCkbess
	h5NWTppYX4dJGwufgeqOpHCzhvKYbrErJctBL2fRlsf6t/ix7gKTQLvHKtw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykaa5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac6795617aso699804a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746208; x=1793351008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jadIZSIrpTyEi91i+IYQ4URvG2pbKwAmmA1d2i8PeOI=;
        b=MfsPAIUPi6Mvi8QPnIvnMuJaoA2IWdBEvkxjUSQr+97yRTu3//WnHEEwEEfL+rIwry
         T4xLf4ZAtxSF+U93TZiezivuXacfLp8jeZp1DnRrRCEro4k21E3nO79rDOBbQGduEoCi
         n+rDBynsrGmSg5bH3b45Atdb168w29YYJgTiOMh5JV/Qxd7AjI6wqF8OhUGVz6+Yykj1
         6i4mLKACZLxXNBBXBUwXKH65hirY0cbjyxv6IZ4sgP4NshypOGF6VwSGGUZ+ea/rH0DP
         aeF+SapJyfaSrSzzyTRmPqEIikIi8lth+NfCqBTGZpNnhJk5b7itUMD+alXBQaed4OV9
         0W6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746208; x=1793351008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jadIZSIrpTyEi91i+IYQ4URvG2pbKwAmmA1d2i8PeOI=;
        b=qtgpxsbFVR+6R9+kWheUo2tg9pdxej4WwCiRK0LA3h4Xqh65VMby9Jlayh2Vjks3UB
         g0yiWDIkAMRwFb4CNl6a/hw0oXRJ8rYFqpS6vY8q29olbDUvKbOxFTgs1aooVtE22qOt
         ydws9KeWnTdz1BNAT9v6lb82GJCpvQk9A1fe/Ve853IlSSPckSTcceJzDFnBvmHVY7Uo
         JJczyOb+cJMQfWZiue6TqyzCBrfEbV0L/owSLB4pKA9KuJZuUejJRI8vVFXUg5Oxb/dv
         dSeQWn8EmH7EPgWaxeqMb7WtHdCtNd0Cro5OoUUZKm17+K/8JsCsgc6p4KYGVdSLwp+y
         k9VA==
X-Forwarded-Encrypted: i=1; AKwUvBzFBb9zQF1GgYrNClH3z6iRc1HL4iDQlgPjLWxy6WD1Tj61P+23DBpSTx/7aNh836MojrOJkiHAsNrnbtux@vger.kernel.org
X-Gm-Message-State: AFq9FYKXbWrqkv5XvJOI1BPliZ1n0366ztkbiqMOv7L+yLCBOo5jZsfs
	eiGzuB6pWmHgBWku1ZOWCNUiekDIXt7RAoXyQQdGfOxnfrVIIRsHdDUugFNe5oGnDM15I6Hm+ab
	j2j5Ufwcx49uLFDw7KMG2AgjRtiz5rQQyFuhxXQtlMQv0/49AMA70XSXWtCGu8gV8oJGR
X-Gm-Gg: AYBFou3mbk4Z20RZ+mKqYiAoEdoFtLIRaTeTSQcICggfEB8tecBw2IBRzZkfF4WxxcN
	pPhayL3CbEopXjigIAP0XXdATmG+QCR//oYuGLh3q0aQIQRUNMecydbs00SfwERbiFFl67SaXUS
	tvmJLWd+wLOAnfuhYGzWKodfO148WnFkkxNN90F+UTwpefLdL41s6ScT1/UY43+PKRRJCJoQlWL
	gI4yzKynV0Bo5MwcjRc26pa3vuMkCWRxEGGHaagkSF2aWw8dgunG7aKDrwgBTKhoctGUJ1XG8Ie
	0C1AbWBhTT4wnXMp46q9WmBa32PkrAcUC4Eq7D91H7cey2s6s4hxQrpPkEuy2XD1fLzxJyCG/LG
	4pTnGfjE66oL4EoNWxuIsoPYkjPh5Fy5vlQ==
X-Received: by 2002:a17:90b:1343:b0:3a8:545a:9e87 with SMTP id 98e67ed59e1d1-3adcdfce5d8mr1244118a91.15.1792746207503;
        Fri, 23 Oct 2026 02:03:27 -0700 (PDT)
X-Received: by 2002:a17:90b:1343:b0:3a8:545a:9e87 with SMTP id 98e67ed59e1d1-3adcdfce5d8mr1244091a91.15.1792746206987;
        Fri, 23 Oct 2026 02:03:26 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:26 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
Subject: [PATCH v2 2/6] arm64: dts: qcom: monaco: Remove FastRPC compute CB9 entry
Date: Fri, 23 Oct 2026 14:33:04 +0530
Message-Id: <20261023090308.2898683-3-abhinav.parihar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX3Mh0YieortXP
 Q3Jbe8sV/sXjXjsdOjshCjpqmNbcSYF59u+S78jom4PBHZlXpCFmUT/FddmruyEJzDbDiDSCa0n
 EEzZC2NBh6Am21Etozml5Bb0ZjYO/rc7R4AymUUb+1ulYgqWZAvJTa9dWOK8gscRcROy8TFbZ1i
 LYrXTuk4A/GJVIyviri3s4bgf5gMWQDc4dkZQtXCuftVYAk72W95Tm6IyNt+fbG4yznyInSc3a/
 MC639k6Zsf6dDqCJnsUR6NyTJPy2j4FzTh+TiRN+IA9HvKXcdW8lfrkOdjefH/ukPh9XiRenWcj
 CtmFwqFNcshmZcjWOBu7irZPsPs5uPzcOOsnvPI7gpTr9PvKHLgYviHRAqiUM/gAlMSg7rsqWta
 UXMuYuLOqnaLJRgqi7fVmzTdqb5myPBIMOgy6rAmobxB11OTpZY2RKCUPr6t2SFvnP9g5Ru5Q8u
 l0DJWeH0lQPvY1cyIsw==
X-Proofpoint-ORIG-GUID: DkjO55t2JWJBYa2TifNUH3qkU11AADBe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX7M5urtd9SbYb
 IgS7n60PUYGs9b4K31kD7qHKvVSl9aGoLT3B/JvaBnxN62arPN0EwR7x97pqcV7YIbOxKDpsfM/
 MxPKua68vvGQKZFmQQQS72TJZ6JjnUw=
X-Proofpoint-GUID: DkjO55t2JWJBYa2TifNUH3qkU11AADBe
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb22e0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tob_Kch83G3grsM8gxYA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

Remove the compute-cb@9 nodes from Monaco device tree to
prevent clients from selecting a secure context bank for normal FastRPC
workloads.

Secure use case support is not currently implemented upstream.

Fixes: af0d19ea5a31 ("arm64: dts: monaco: extend fastrpc compute cb")
Cc: stable@vger.kernel.org
Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..e73a735f2f13 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7822,13 +7822,6 @@ compute-cb@8 {
 						dma-coherent;
 					};
 
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&apps_smmu 0x19c9 0x0400>;
-						dma-coherent;
-					};
-
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <0xb>;
-- 
2.34.1

