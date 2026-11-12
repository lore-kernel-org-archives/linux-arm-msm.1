Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458234;
	b=ILZtlrMP8rvwwoC4LHgLblJUBtBWY4AJd0CYK24V/OL1iY9NyiEsDrBUOea3Fc3sJN/K
	 8kfj+OMV51kdD7DUNXE9h8bF8ihohH5+63WhTYXVOj6ZusjoDua/wGmVgPBWyB5YUeO8q
	 RVa+YPq/YpwbXr7KJ3n8dBSgwf7QYMjd/uCgyh9YX1YFUVdch730hwSaAb7mlT0ryxpkn
	 FtHXAsFYDtYn7OOsj/cg4usK/olEe5D+zFzkRwYGc3P+pftt8N3NF7whtcRanfYZnA7F3
	 fm7S0BNW6cbEH463JqzPphBc1lJomElYzochJhhs/SVocBShlOiXyzo9LUeFniMiKgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3h0TKREiz8XiAIj9Eio+1IUcx3jgk7VkK3TDMns8tw4=;
	b=Z1AI5P1Kl+N0JtXUMA8+HxXnWwy5zlkOhanMjzMZH8nskDvKoN+GNqEIr0l9rEDeY551
	 /HP00/8x7JEFpp1cjPP0anxnJb2eaLWqLra8nnlYmYUTo0T6hj6pxU2Csk1VQjBaKmEHX
	 D04mJRCvDjKDXOciurv3gt/5Nfcd4Vhiyql6ydwbAW/AueeIEnKsL2qKWj0TqZthEqXJU
	 r+xJw+Crn2yCiIevBHZPY4pk+fzt9c9/Q39BVl6XbWeZlMz2n7IBfViYb9xIyIviiwREw
	 TIv/elfZ7oOctO8BaIa0cKh/sgHnZu7H+mOQlhrur+IXeQDQHIeBpEbEuE2edn/YZGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebGcwWpu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XGzksrpO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB6A606B9F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB6A606B9F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebGcwWpu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XGzksrpO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZUxf4149276
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3h0TKREiz8XiAIj9Eio+1IUcx3jgk7VkK3TDMns8tw4=; b=ebGcwWpuFp0SvaDp
	fWXCaG9EeM5OTnqzA7O3NcYXzaLAywLLiW1/tKlR0rk7/VKPIQ+Vpk/PK/B9ydnS
	RqTEm7ybzl1o29wqVA8ebsOpnuPNLijoWXdrA1ZyeRqAuqkY3iz9uMF8nTN9tnKd
	yeYDnnaWo1vj2V1+Fx+ZwsDE9pxZjp/MhGR9HWG0zKRw2KpZ3+C3ykjYYEJns46G
	+DXa7GROsHEuxhTEBOQsla6f9I1KjVwEZQbGmsa+T7UHdtOMWVibEwW37GH6erTw
	Iv/Q1kjNQHTCJkhhkWSCZ+PZJZsGqdkzq3B4U/zNAvx8KoAAPYuGrlUquuSV1UDW
	yauLaw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc61pt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so6370186eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458232; x=1795063032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3h0TKREiz8XiAIj9Eio+1IUcx3jgk7VkK3TDMns8tw4=;
        b=XGzksrpOPLliIpFibfr92ScTUgXFufO2eCDVDCOlAorCvRVzgLRWXc1UaDFGg0euqz
         wYxxTdRQn+JvXf58JJRF16bSdUO/IRvISVc57noxosTuB1WWoS6G82jDBiaNqCsCsENt
         X7kqHhnFI1DgkLgfjKg8VHDkL8cVVtY0+mv3G9BcCS9uYH+5/dJwJu7X5H69ne3sQBQ2
         5jVHXt0NxQbpNmrshlskQqXmw77Ie3C6fFzDZeSj0gUvDnzzJjabpnQcKk7OB5qZttAn
         +4eEtVUVR4gOsFRM2RSdukyf9ORG5scz9+HCxQE1GpPw9o7pBrqQLqvTStOrscnKhmDo
         y2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458232; x=1795063032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3h0TKREiz8XiAIj9Eio+1IUcx3jgk7VkK3TDMns8tw4=;
        b=wd16GdYXgrTbn6o6lEpQs+2MzcMsBuXhpbeaSyIa7i97ZqRnWhyBls4Ml+Tt1U1c4Z
         EKR1K9qBFiVmvEYeOsueyvl9cMeO6QulHg0cboMhbqi8wDZP3Pu1Yk/N1HwY/YpirZfs
         FAmfaYPSbnuWw8Lv43k5tdzSIPxYFTbe2nLcCqqr7idPuqn5B6v+sIhXhbTeVqWxKXey
         qq8LeMGWsxL9puviL3QERYqsO/COj+Ty6DS0QArM8Mqj3w/VMQRKK7GXTKOlgz9kuUrC
         t/9A6XaPjJsL6dlBoZ/5cQLi9ulkhABBAPn7iikUqWIA7h5l6+X1/SMXk6MWT6X0Okkr
         RlPA==
X-Gm-Message-State: APuU4Z94Ey0CuPE3Kz3PObcDlaDav40886ywLxyMQJ/u8p3YsYVHzQbA
	XafZrRwIt2y+rQef8w1zUUBcRUFjZFWgKgPnFd28h4wxVufJmGrHMkKYsbdIoTF5xCQXKzsG39y
	oOlOEUlQCw5vjQ5Zoln5JbUci1oMpGu2VTTZYss1TUKbq5brgz8OhGU1Vs5ncUUimTwjZ
X-Gm-Gg: AYBFou3LPIy1htGWfJRmzUA7mOufEINxB5fIpbqf+vHZc4KEaH065Z/39ZQCr7jFQ1p
	1aLneBzSqDmwJtldcyhCteq4OBJB3PuaQNibzboFZvx039/n6JWImrzZB7QWx4Fs8GhaCZmxj9F
	36YVECvH34/yd7GQBLuul+4FHiDlLy3TJKHDAwGYlQKVNj3xC7gp7GCOA3bqQN18xd1rfAatkXc
	PrY3uXM+s/0ZpcmvbHDjXLXxXwnoXGvpMybVJa1lZDcykgwVG7/Kh45+R2QAS4RmIDPA+A1Hsou
	By1kIDzwtzbRV6DyK67lEx2Rbhd9nMZ7ly0/xyaupEXrQYbe13r76vWJhBo+6lVWuOxhc36DFv6
	VIztX1C0tkPzVtaHR/pOOC8yPmfmP+6X9+sOfAfhSIfw6FbrgN7xcxwZRHwFpcIgkvth9czpGeS
	MDtwF1Nv1dVz8LH/hAzPWwgRIUlEX7FMqZIfX4NN2vg2WxOIY+aEBBOI7cn1qaMBi893xnMRL1I
	hx35zc=
X-Received: by 2002:a05:693c:83cb:20b0:372:33cb:fa85 with SMTP id 5a478bee46e88-37686a4a68amr4781001eec.29.1794458232106;
        Wed, 11 Nov 2026 20:37:12 -0800 (PST)
X-Received: by 2002:a05:693c:83cb:20b0:372:33cb:fa85 with SMTP id 5a478bee46e88-37686a4a68amr4780984eec.29.1794458231548;
        Wed, 11 Nov 2026 20:37:11 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:37:11 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:30 +0530
Subject: [PATCH v9 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
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
Message-Id: <20261112-08-dts-v9-11-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: lu5NEWnQDgkwKw9bmmmFXDA4BO__6JEG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX2i4UzAHsid4o
 cf6AMVjsVwDc5Lr6PbObUWPxVvJsqdEvUNRQtt/H/HfvykqbzyXdsnVnTgFT+jaxy2g2TldUsrb
 497vyqorHBWR/2w3YeMAz4e1UpYrBkY1t0IMx/uW+Nkxsyp104IzEtAxNk7O3HREN/RoXqri7xK
 3dn02moLsW7fMAqts62SgxwkPMQ0XXX8+zjk5Q705VAqNHUQJHdoFRcEwW/6R2i1TBs4gxToDlZ
 mx6tZaRAubqtU0OTcS5nkJiSfLXcQjSWvWpsHS7C3zujVDaI+G3rJU4i9I3jH4plTkXFC9wm0Aw
 /i70Kiy6+sFBaLS0tRcvzoUj8kVEDOaiUy2yWS7ndU/tr89PzT3e3F/F3ZqlT9PurxL7+X0I3Kn
 283Nx+qdK5yF6twsJ+8p7YH/Fnv4OCKsU5E92N9lZt4kIc3LZofGo+HfBXyGs2mAaYPTSBahTPz
 4I83O8lCnmrU1AvieNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX9kFWip5pzo1P
 4GgEU9ed3mukMnwipTDYqqeniLqUnIqmD+6mD4MBCBaT68lSgih+WLHiyhZRm4wi0oUV5yApGWa
 L88QXELfDgOPYwauYh+VwC07uaQ3Lto=
X-Proofpoint-GUID: lu5NEWnQDgkwKw9bmmmFXDA4BO__6JEG
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af54279 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XHihiHp7Beehtrn9I_oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Add random generator node for the RNG block present in IPQ5210.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 052c2f3df94d..219b3f3696e5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -411,6 +411,13 @@ tsens: thermal-sensor@4a9000 {
 			#qcom,sensors = <5>;
 		};
 
+		rng: rng@4c3000 {
+			compatible = "qcom,ipq5210-trng", "qcom,trng";
+			reg = <0x0 0x004c3000 0x0 0x1000>;
+			clocks = <&gcc GCC_QRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;

-- 
2.34.1

