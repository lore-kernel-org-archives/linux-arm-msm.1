Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A846B4FB9BD
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 16:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540623; cv=none; b=S5GLpKMfPGovgzyJ8oYa23n0GNc6pk4TEzmAEa1+8xHxc1+XvAsmAqxJfn3D/Ad73wNVemoJQ070Ub9zHD1Ymr1/Zmvw62ybvvTCPe7TjgxaVUtZ4bQyynKUEsZFpQiqp+U+VYwMZn4SG4DzOIcwQPDA22DsX9l1H1OOMmPYvhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540623; c=relaxed/simple;
	bh=lDNbqTejEMmezXfm8vR/BB1uVzmfG1dNrk2FkS74AYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7ENorAF09DVFPHUTCBeiXMFcpQjQNKnTvreZhH9sSsdsRMqCs31ZOmi4TF1B5nvEhwijDwr8lOhXJEt3kkxGDSkZ4jpZXdiBHKEOqPOTo7q96wmwSYYZfTYHt19jNFv7kGuCgSowLF0mgCh6PY0m66Ft/aRIDyL3myNj4rPEgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7PkSOiG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdSwcUKM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7PkSOiG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdSwcUKM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiK4M468178
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 16:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWKJCDngvZH2rmdr953e/PNuUcc8GQpzwTa+yRtv1Xc=; b=f7PkSOiGoJngWWSH
	MU70sT3sp7iL1QCAf/2GrjDIDEoTpONPgiEGtELvSttrMC9hmInx4aZwV8UySpJq
	ptxHZHgkiRyl2UsGl3HgRr5phOKuNvhA9vrRq/vVgHnNmopy7A5X61jaXw3N9KHC
	OKOkM2S4XZA6E7hg4B4+RKqnvb71/97mgGUn/cKi8172EY9d09Fozx6ibQGEu+ys
	xuaAT/t/sYAAI7rO+mSs39zxbRDmGPH0dmFM3Ez8iGMnstJPrvMUdxC5SNJc9AYf
	cp37sLsvSUrCxAOizIlKudHB+v5H+1BRjmaYIPhi1iBCN9r9cAphNGlnD0NaARAY
	uMNU5A==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg0108ne3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 16:50:20 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1abf73d1fso807701eaf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788540620; x=1789145420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWKJCDngvZH2rmdr953e/PNuUcc8GQpzwTa+yRtv1Xc=;
        b=KdSwcUKMqM4D1bSyl8WNhGulm5yYJqVRjFziKkt0ahqhbUPnOl5YupNO0ZAKkI1Lxs
         xySvNbavGSEbCIdWBmKihtRRdwnPhLP7vn+7RdiVOM69BsXt9dnBQVcFGwiqchxTL30K
         sNqxCfWHmrbhbCHn2dQr5GOdmawSP7a5aW3J5fuDPhRilCHeDTX5SXUG78aGE5J5OitP
         iUmQtXXIxFPxA2dxtpJnj3R5ZB8bueG2kKkoskqVcbQXKdOMkRUpmf9i5JWC+oxk4Ety
         SptNcsHQfyjH50HtnI/ytsL7SjTv2J6MYN/jIjB4X5Hz8Y5ArY8xDf2a3ad3SpMdvoVR
         X65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540620; x=1789145420;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWKJCDngvZH2rmdr953e/PNuUcc8GQpzwTa+yRtv1Xc=;
        b=PTPX2BmZ02/i99u0WWMQc+IQx2r79/c+VwUaTo5rvHS1HSq1zZLsM6FW+4p0uksMfj
         cBEbvJkalm+7RPPwLhmOBHO3dCdNwD3Q9ec4TUou6IR8FYh2S/EGZI+9/gVV6lmkve0c
         sBfLBWbbPFp/zjdVL5ggUOhF8hMIbSu9+Guv6MrByLXB0/dQI/Nrzz5vokaWslOqv8Yz
         SsWhA8Gy0buCrbZCU6syURp00cZObr9VBLe/PR1jAttI+rl7OXcVLGihYDDlzAoEi7He
         8gpNA2fHvlwpSaIZzHquWF7aq27xFXQMniPNK4YHqrDBhfVzGtWBo351pekQiPE9R6aP
         E+rw==
X-Gm-Message-State: AFuF++n0oGepkNd6+5ie4Waw5XMLgIFQbXsfUz2ihPgCzISepHZVkeeF
	6f7nz5USGbh65BlD/13N3tXRjWWgm4awi6eaIrnFxwkT2lTx7dEIzXsxiPnuBgB2CR35ppK0ud/
	CVHGff5v2rAcXo7BXXpv3przi7/0Hi/nNIz7EpNL/mkdmSzTCy0ey4ZcI2KtkGtQS6RN9
X-Gm-Gg: AYBFou0CmkS22d9l9dhnsbn+QtZkOyq7TnZkZdy86Y74Y9hLDiBRFdmfKlzEBsFObgZ
	Hc7t52RkQ6wmGrrSNM+t1JuOFbiPZ/2qgADNG1IobFf6TKpw1weXb3bVPse1SGTiMKNLuxbuw4R
	NSo5jZIP+w8pmQnYu0aZlCf4bINN/BKyRwfgReoA1oG1gVK4olYcUAtEqa8A+QdawAzG4MzGYiu
	FbjeVhPw8QgIdoGGCZy/rcUKsfxk+fzb+vFdHNCDGq3NDcFogBtekcpdqJczxOgTCe5tNRxu/s0
	eTca4AWt4D5bEJnVZulTw2fkZ2e6xEDQo+8rHuEPrpgmltFB+S8+lFTAaLQBMkpiCekznol3ati
	9M273fcaknDFLXcAThQPXP77rbPIN
X-Received: by 2002:a05:6820:1997:b0:6a3:7ad3:e728 with SMTP id 006d021491bc7-6b6fe2aefbbmr5824201eaf.28.1788540620011;
        Fri, 04 Sep 2026 09:50:20 -0700 (PDT)
X-Received: by 2002:a05:6820:1997:b0:6a3:7ad3:e728 with SMTP id 006d021491bc7-6b6fe2aefbbmr5824170eaf.28.1788540619582;
        Fri, 04 Sep 2026 09:50:19 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm7908181eec.13.2026.09.04.09.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 09:50:19 -0700 (PDT)
Message-ID: <59c19f76-a500-48a2-b26f-2790acf90324@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 22:20:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
 <20260904-x1e-camss-csi2-phy-dtsi-v5-7-dc81d85b599d@linaro.org>
 <h9nOR7GlvxjT997LaUTvLw-sxfP1Z2atHnkiAqEDoeKmSVDDqnM5xr0A_6qE5Y2pzemrKuMc7KNPLyPF3KSk9Q==@protonmail.internalid>
 <65c956d1-eadf-4bdb-bd66-0530421fda0f@oss.qualcomm.com>
 <92afc051-3960-43c7-9104-159640a363cd@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <92afc051-3960-43c7-9104-159640a363cd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9TAHv_3ZHbxaqReW0MagU4zZWz8A6p9w
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1MiBTYWx0ZWRfXyYHRnMk0tH35
 gFTdx+KOV0buNFmRULGiKU9WLWxK3CWY9dQpPCYX0yhmJidx8LFQ9wvmTXgygZWHPeZPcAC5xUa
 aub+eh5q3oSHyCOszCcziJ5Uilbw4Og=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1MiBTYWx0ZWRfX+Iie0YeA1v83
 lGekhy1gCrnWQ9s9fjInqM6aEXeHIa/qcvwbOLR7u9pMcseNnUZufBLEwk6XS7Hz5AAm6wBxbdz
 wIUGbWcFyu02Cx5Xg6yrvCAVLoMydW3D/yVRpFyg0iA1tstsAY1tIdImZPfSg9uVI1IG+n7hskq
 f1UelTUL9QbvWHAwPqregra4NyXCmadQuv2Ik/5JWhq0r3/goQGm2LMi3HY0jVZZC+IHRxTnnes
 a98IhS9atXsYh3onx898bHJdwura9xSVHzm1ecHPrvW8fCwyzPLpjo8DxO2JJGonl9upx4tYYnR
 8XiiB7RhKfxKrHpQR1hJNZDmBNwEmVitgOXRYmZj/XKzTNSUFqawxZv8aS1/AekiUfbQk28riWB
 Mt4i5HXLmcrp/rrrhnQB0AZRkmAaaH2D9amc8kW9cLAev6p76GvltYr9+wG05BV6CAu6J80gxb9
 sw1tbjmxlbWIPWoQg5g==
X-Authority-Analysis: v=2.4 cv=Zp7d7d7G c=1 sm=1 tr=0 ts=6a9af6cc cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=UQytLGTC8N96CC/hvWkJ6g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=actCtQdN87A_g-25alAA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: 9TAHv_3ZHbxaqReW0MagU4zZWz8A6p9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040152



On 04-09-2026 21:43, Bryan O'Donoghue wrote:
> Sigh, I can write a patch to count the number of lanes instead of what the code currently does.
> 
> That way the old method and a new method based on +1 will not collide.

Thanks for the explanation.

The driver patch to count the number of lanes would be appreciated.
That will align <0 1 2 3> to <1 2 3 4> data-lanes and keep both ends consistent.

---
Regards,
Nihal Kumar Gupta

