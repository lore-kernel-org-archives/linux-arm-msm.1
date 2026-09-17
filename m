Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34D24E323C
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658345; cv=none; b=q/LgJ5n0rJxqAF4/tcjV0ZcwSd3JEkYLamS3mxiG+z9JR9567PdgTA+/1L1dGurOgmZPgSz46ZhN+Kh6UMLn/21wLJP2Bm7xR6aoKzAWnjx0KRbzAQFG3fSPCc2b88zopMPLRwAGW5C6KxYoBYjx5YYCGMzPW7ckz5dhECs0cxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658345; c=relaxed/simple;
	bh=kELmudUjcgsQ8KhsRQraj2ps1KtN9s+Jx499XU/pG1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lI4hQVwG7PyxSUMHfj/hJC+W4BbkPXTz257JCLK+hcXW6EmFY7Hos7XbwlAbX/q5ze9YVnRqVbTk9wbm0UffUr3C+K17d6/XYoNpcmlWGfBHmOnckY4zawmIHveOIMwwseAxOPYTwN/lY8yAwWeFODQHCZn+ES8Hfb6X3576KAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFy3zPLp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBUUNZLm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFy3zPLp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBUUNZLm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiXGf2974916
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eDFZ7vk2von69CQmhrGnntWS
	hCc8tgxQSOHrgI2CZEc=; b=PFy3zPLplKzeUn+Bh8E88upjXttjqBAYfGL3d872
	3mJ3wXCCUxfrP9Y6Jg9YADGoOzH5zEvvobCbiy0kHzX186nAq5jjCk7moIDB6N/H
	GE273ffyG8UeBrh3/2IqXWZvY7Heev3u1F7HcaeAmkfvP+A86zQcFCMpo5e3fOSm
	l2OB1uq5OJNnKrif/M8SiXmkuPUsZmEEgj4c6BCYfwRAPc1TVs4kOjjdRIDNC4Mp
	6PjQ0MBpvU+g6nQne+PKEu0pmqxgplS1W5PWSgUsD2mXlCQsbu17bAx8V8+jM6Or
	oJ4QTB2WzeXurpHFv7ZZneiGwb0g2yGfKenGC6u3/Twvgg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6hnaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:18:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9124b265371so16185796d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658328; x=1790263128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eDFZ7vk2von69CQmhrGnntWShCc8tgxQSOHrgI2CZEc=;
        b=iBUUNZLmYelzNhgtTFd3g0gE4pe5apmCtJ7ViBmcSwi4SokA+J1F3IACcr9Ff1zegI
         8g6R+hog2MaNMPUqzSo4NeeXyYNNKR63EurrmI7a9sKSpknxByLk3FRh1qdfiLwpwWlv
         +8mTyonFqaSYv2n3086xHtiMKi0fs3t9iSWY23eBeANvzR1ntVlSIv8VCcRd2sA0r2Ms
         GnVZUCECg6oafNRPBs1naxl53wtboKcQfcamMqM3VQxEkjIfdaV89WT0gZIe5h5ySH1t
         NsVONigO/11pA022z/BU3i85Yfn5A3bMFSMK9wNOhWxZ/cofe1lqyBXGsK1G8yOlpqcu
         vWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658328; x=1790263128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDFZ7vk2von69CQmhrGnntWShCc8tgxQSOHrgI2CZEc=;
        b=TT8SBqPhFY5qKWt3RFbaI+/7Vzd09r+5OTqlP0wUWIMdOUq7Qk1dSY0ndGKMj5O5+7
         piaeV27wk8gpvj7L45NsEHjx8vf+SKuVZNKmydP2UWaXeXe/U0qIo7o1akONEXVGbdQf
         B7BDdXnMtbuwDpKRfEnypTra60RjxQwETymG5lgKPv36EXWcFv3rE8ho7VM47l5oYZGW
         f06BbFTsAs3F4M/Ga2wyEBSRCA1IyWya8is2nAVhl1lmXUi+VXc1Tooox5ydzls+72bJ
         UCEkDkpjUGmOCE6sR+udvAJ5e2TOkvI1NuN99wujR/3dj2Skpr4qSm/lztlIrzh1u7C5
         OMug==
X-Forwarded-Encrypted: i=1; AKwUvBxqfnsDALMaqaK/uloKnSFaO+idoIy1s+J/uFeRD/bFXQ1z9G47eKbIt3jZrw656Cew/WrkMhoOhbQZx1c1@vger.kernel.org
X-Gm-Message-State: AFuF++ndwUqDPQxI8dDCoU4xc3USsu9l8oxOyvUR1RqgnpmohIc8/uhc
	N1L/JLPQeL2prnfwIFm0eLlMlDsSjenpT3dc6Zf3mQ9vxC2jQSIN04lhU0LAlDmtLO90aNwqpHN
	jBJMsWwkJOTXYrFUM7QByloEIoBYGBG0QAgcuxz5ED32lvLzCEPIp1M4QKnh0nK3Hv2sS
X-Gm-Gg: AYBFou3puI/cxS4K+j2G3Y9ZOJT8hZ1PX5cdeAG8ougVKQWtB/X/66JY6trImf8fjXY
	GU+LHfgDsxngK+8s3zhDF06H/v7BKlRwX6zwwI9lb+u4GurOkRRV18L5yKXg1uu0UzV2/ruaZne
	WJrXMa5EeaCJ+onBRXXbcY1Qyy/OJIBSALORMfJwe97SkjExEod6UiTsRSivunPqgvpIjbVSfol
	8xHlukTt28rVfv8tBNWrUo3eZdEKj7IyTvJRkQEZyZ5DceF1+7+8z0Y7Bssv/TY5PosEHDir+i3
	dpvsOgAa1y72Yu0QeBslbuNFzbD5wbdrvE2/5RDmkb3PYDfwPCZivvkxAe0Ev44sqZ8fKHjZ3Vk
	RNH1xGdlSEiQLhDg=
X-Received: by 2002:a05:6214:262b:b0:90c:e389:a627 with SMTP id 6a1803df08f44-9123d62a6e0mr132215556d6.0.1789658327577;
        Thu, 17 Sep 2026 08:18:47 -0700 (PDT)
X-Received: by 2002:a05:6214:262b:b0:90c:e389:a627 with SMTP id 6a1803df08f44-9123d62a6e0mr132214906d6.0.1789658327001;
        Thu, 17 Sep 2026 08:18:47 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bcc7d1esm16166920f8f.0.2026.09.17.08.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:18:46 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:18:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/15] arm64: dts: qcom: sm8350: Move PCIe phy and
 GPIOs to root port node
Message-ID: <7ly7dy2uqil3ysjw2jomjoh73cmzi72alsgsqhugikzdwj2sib@ktjg566sylkl>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-9-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-9-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-GUID: CtnqcCRdeju8Ubc7bOESwxg_JQb33acn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX9NMmKSYVQNgC
 cmZnESXoY2KoAMXs6I+TrmlQME5hhIChLUQHsuZLqPs0WFpjTK7yjjO1YeL4Fk3zlmke3d75/4M
 m9c2FHBhwYH6dINhVb3EcMI1erFtKZbHyqb2FeHONYIxO6W7QeI8TC/KFfhl4AiVO1l3Cw5GGjA
 qQynRcxsJjTWwpU4AR41Cg3s3EXHZXA7LQe0M7PjeUhPQEBr8tYETNfyx5OI8DmkPlWw0gtvJrG
 XuNMg1nTzuC8I/Ah1YnNticMwCYqhg2ryB8ZcrnN2TEz5FxI8Y0nFCTBkt0Ks/zWNliC5BLgUJ3
 VwjrJgWLjdiaCOql0T5abmOutfPJt572MGTtkaD5L2yVlM8nM2MLyzO3bta1WxjOkbhJ/ayY8i1
 hUCEgcjDEiDJi4z3xseR6dOXWAFdteFuKX+xltYlL92NP5w5pGdN2fftjjkbL/vm/PnpMRaQ8ox
 4C7ax6FFwbk6b/q4QmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX+LCuPkGYKqdF
 uExq79GFKg2t3X2o6ISIjKbbrRdpp/jZRoWiJC4fyb/gC+C8VX+/4OGZtzp8AS/H6RPdzsDOKkw
 0Dw/RF/8Cm4fvt0LRLgQ/zFnHeOcU+4=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aac04d8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: CtnqcCRdeju8Ubc7bOESwxg_JQb33acn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170216

On 26-09-17 17:55:23, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board file,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
