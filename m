Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746231;
	b=kvY3rUt23mWmgGRvbyeYT5j7ALGvBsZM7tSepmpbr3viiW2ODlL4/VZe6KszftiWluTY
	 9TAov+ZQdZjkDanJ9IpwKEwT4PD+R8E+mjZ0nY/GhwqIZat4LVQqo6A4dPYkaNnyOtziP
	 65eKDPKPF12Y4Yudl1uSvWZUtFkx8K04mZexwy8Sf0adZJ+aqLqB3dRkxhz0hF3OiG8W9
	 6f2gONCqUiYtFAjVPd5BA1eaLoMp/ZsKdtWv0KsIl4hSuk4vznP/6FH8kAmRPvGQdih4G
	 IUGj3TJxjBETIpkmgL/hSkErSrj27wkO9/R476mSp8Lfg4mY56uQIif+5ajVc1VoF7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EhRIYoT55j9ig8mGHfIEupQGVMISzGazIaZrj/4btXE=;
	b=WUIluYbifrfM2hoz8sFBEGeH5KR5ZHf+wYBFmb0hgrdix8r9yDcwsyBb/fAae4CGue4B
	 Tv9iEmuB1F1+rEjoj23hBO91qVID+6UyFcNgoZDYLQm0glVmR6ZmZ24KijRdgGP4R8EX8
	 ijOvLOTWQC6g88QeZLldD2FW1vy2U00ZYFgrkgrqVqEo53NHD2QOAy5lU38eyQzHwlizX
	 0mQc1fCEy3bZ3e+CNR0UBxXF83rzH7iTuFCVtq+u5xV20/uiWyBa/iCjxhhv6aDj7s45d
	 ZMrmt3QUSt+Fd/jLtdvO8GCANFKifgT1ITlSvXoAtPGzgilYnfOUlsMUBzCQEzbBy8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNnya9H7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bo27Z13I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02563606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02563606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNnya9H7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bo27Z13I
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FL1W1552394
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EhRIYoT55j9
	ig8mGHfIEupQGVMISzGazIaZrj/4btXE=; b=oNnya9H71PxHpHVdWa6UdI2Fpqr
	RAlkKwL56vIVmImFPeL+WraxnAv4ocEDUrEXkh/p5Ev+MgY3vyac6fKmBmGgZ62R
	46ZoMSkbvMAvSFNM8quyhemenFvIHGCIK42QtgW32IGMG4JS4GBh0O26wZq8KVEB
	bQSzOdjGZTcKEauPhxqkNxQCbzTjLeU1GFV2XnDSCwiyd8ao+bMOp1pjJDEX4S+6
	LMTD6sF+usPRdctUauAWxeqc2DSAqVXBMQnGQZ9+6HY8QMN4YPQ6fYc2/c/V3Hvl
	R0pm9QMY4PyDeAbIvaZ2o1y7BzFClrmQMVFKQVRA+FOSLCTJ3W0jPsqViFw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttv1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd6969473a4so470937a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746230; x=1793351030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhRIYoT55j9ig8mGHfIEupQGVMISzGazIaZrj/4btXE=;
        b=Bo27Z13Ipn016rFW55XN6GYdXslelEAAFsr46tbfA6lrF8QKWzL53HDfMuxvMhXLgS
         i6vsZYAAL4AHqLUQCmzBIftOhJGWCL+w9daeqELCZa5bd30GIpPmvWllO+165ZQJGZfs
         f9sA5C0iGKwfT6RgpFP0+qebtMygDu1TXPnCQTXIgd9Xvl7vb4XsGu1fukZTcBmbEYNm
         MqFIheELuVt8Nhhrc4ZRVaotXJlnF0xjzX2lu6avaIrHmIS+TP6HNUEafeHhMSRCotFo
         l/Dp2s9iVpn+ftf9B+3ziyEn+Ciavha8ZgSV/q4XDlULRWUUvtOeg3SNQWGqEuRttRJA
         fBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746230; x=1793351030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhRIYoT55j9ig8mGHfIEupQGVMISzGazIaZrj/4btXE=;
        b=BJgI5FFc51ORXpDEuyVLe311CqOVtT7dGuRXNPo6XtS79RIqG86eJlADACwpkLjI/J
         BWWzFuTcWf/Qbgsq/eAvBjljZueJGhh7YYalCYg3JookBWOxXl0BxEhNky+bpsecwwnP
         q7dFxusvIKhnOUzLloIu82euSvjdytQDnwHaY3VVyEFZUH9J1w2rtQ8p5Y0DvBD1ebdD
         SL2+ZELILC67hzYCOI7zSBq45mK2WhS57li97x60jiSepKNksSinY1g2kbzu0RsUKGwN
         SplcYlobxCtMVhMiMFMp4qnKykGmDh82R63Ag5N8A9BhHVhv+Stekps4OwzbZUNGQQMV
         sU6A==
X-Forwarded-Encrypted: i=1; AKwUvBxj2H1KkJh93o/hZzVeJQGt9yS1pnrg9IdfojXNAA2mvYznrpqU5sjbYmZkl1TOYvpS5xon6X7hhfBycFG8@vger.kernel.org
X-Gm-Message-State: AFq9FYKmKaqu7Jkm+n82DKsFCTXlFElnOnEnxoQCB2i5xvb8ru7F57q2
	IbU9VRVcSx09UgT0Ta1ODb9B52D/PVmW45tjgQ3iruZkqVNJV7RPrjH5yVxNZNJXxjlYVBu492q
	1xnuj0h+cwHlwMCxCqnKRiezfjyFjwE8r+/2R+EwKbrS+wi5NO3XMHEwasdlbzWIMJs39
X-Gm-Gg: AYBFou2O8pKiM8nK96JGDTRjCdS6PPGBPp3jJJlUJkdJ9bcLlRJAD+yVWgpyasKYJ1b
	9CdjzcoB2HVbRfbL/mMm4vJK47esrRV4UKHt7ylhjUMpF6eMKQPs9e49ovIHPvzaom09WpAKHqb
	LcibN/pdiKbTwcUTY8pjPUQjUyGld/vWU02S8dzHpMQuHFwBeF7aBMdXR3T0sXL0aHw04GQ4JPx
	PnNPAu+nEeXpFRLrh9qO6XSluRW+pdQcYZbr04rqP4WhX6DwALDWSDP+uz03f8e+haWqjVwR0us
	3ZiQHWVAydEnnBn6XyWla1m23zlL85FjXKM+X8FAyXdpW+RV3QsPa0xo39yOkYD+tvQdmdZDqA1
	YlB1y1zxgfp5771SKwoN74A+u9tXU4xpuNA==
X-Received: by 2002:a05:6a21:6e91:b0:3e0:c5f5:626c with SMTP id adf61e73a8af0-3e36945f18fmr1219879637.40.1792746229775;
        Fri, 23 Oct 2026 02:03:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e91:b0:3e0:c5f5:626c with SMTP id adf61e73a8af0-3e36945f18fmr1219869637.40.1792746229374;
        Fri, 23 Oct 2026 02:03:49 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:49 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: qcom: msm8996: Remove FastRPC compute CB9 entry
Date: Fri, 23 Oct 2026 14:33:08 +0530
Message-Id: <20261023090308.2898683-7-abhinav.parihar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb22f6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vzw34t4vhacumBYsXzkA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 5ROsl6vyOHSAGH2QV9fhQ9kaZTa-nYlu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXyYhGYn9uL8AG
 knFJbrr492SJCdbtVf+wBmVIj78BWQ3GufLEUz+vz7P5Bc3Mcr9dZNGQxU6nxRoXjZ1rjvwYGPs
 OfCV7+kCHkZWMz/Rll9WDsbmL8yjGy5XAqsQFvDzF0zqNZKCmZiKBk9c+iKcKmGO0wAknrp35GP
 f67gtjV/R6p52ko0du7VOsZfV2tAyW7Zh35bInjI4bEwfwf21LTd7r/aeiWajCmhvRxynfcc02R
 hdyINXnw6+oqLiZTXV67iivzb6ex8+QTvqN12GNOtpXiKQg+esbTAXaMv49kxP7FqhfqSfUDBBH
 sVQ7nEtkhlMkIqjvdn/pJaosHwNmF3nXx9rEpq+nAggKEaIfQ1IOmQ/778raxB2lmCv1T1nJBCn
 GbUCzL+F/uDTh5p5A1WotJhLkeY2aklLOJt9Zrc2ej/dvFpCPBOTBn6Cavispu8N3c39K/fRFxN
 P/nheuatBdtf9DYoGXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXw+JHz5zNxEYh
 FIZvEkLd3PANoSingaO7kqF6lssoteVq/nAeFDPHGA3Mr7Xvny3TBKfAquziOuqrmw0voAsJoT1
 1S9d9QDigrNVBAsJhr1DHdFB5l9n9aw=
X-Proofpoint-ORIG-GUID: 5ROsl6vyOHSAGH2QV9fhQ9kaZTa-nYlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230035

Remove the compute-cb@9 nodes from msm8996 device tree to
prevent clients from selecting a secure context bank for normal FastRPC
workloads.

Secure use case support is not currently implemented upstream.

Fixes: 1b80b83f893d ("arm64: dts: qcom: msm8996: add fastrpc nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 818e5660df91..51ef306c1ce0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3701,12 +3701,6 @@ cb@8 {
 						iommus = <&lpass_q6_smmu 8>;
 					};
 
-					cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&lpass_q6_smmu 9>;
-					};
-
 					cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <10>;
-- 
2.34.1

