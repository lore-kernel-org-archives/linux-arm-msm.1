Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21CC459AE5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804598; cv=none; b=Di3CWczM/1lUs1RlYA/4Qc8nysyMWzUsWySZ44qDpxcVshLvDsCtmRuu2nsXEQSTcC9bGqAtM/SVWYXqyXOW52vvj4ElpXxSKTCEwdMA/mkAjMpnT4xjFiOVfRWf2R03WVper7GecsbDGXGAYUVWlfb7wVrl/fJ8R1NC3SQEuZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804598; c=relaxed/simple;
	bh=3s26Vdb3mKqRAbHFRW5zBeLdM3S6FsWEuze20i41KLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gd3FkcwT/C3Eh8nF7My4yllU/9JEYcaZtuRUW6KAR33Su3xjtjnHXgaTXYmWrwGitfrXQIeQV/vKrLYxjj0E0NAPUZpddR2+F+Gs9jUi/tW4jBfgPg4izhO4Wsm5zik1blLUFMKK3Tot4K5INs4hjvnN2/Vsn5Cxz+TlG6sZsCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l5/xmkAP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XajnCaHN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l5/xmkAP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XajnCaHN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qWAP3260957
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ztvueMVJEJAC1AJjh/aLjN/yFYMvLc/M/qZzkG7fw8=; b=l5/xmkAP+Sdcbc71
	E+eaYdRUwMYJ1EFx9HDk+0SYCjV0BzYoUBfQLqg2hxjLmh5VE/PWcvppCJMwaLks
	cuXSpAa4zs2ZNE24i/L53+saPmr+/TX0pqZ/Dktigp+bluzoYl2hswUHVNJDCyrS
	ZuvlBfk4DQs9iaJT8nX0KBi/PegBe5MUEdF/ygu8Wi+j+TO30Ggx+t2uSCuVINB0
	xrlLxG63spY/8W0k9YVlmqQknsaTsHqdwpFtkwBlGLFzjvSI5fa5MFHCmz5I9UWC
	iDh3EZh8vZhmKRM/LTPvgB1brfBF20HY1rhtRTYHEZIV+i1ZwJkqY/JuKQhlICN6
	C6uWfw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw1syy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:03:11 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so11642e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804585; x=1785409385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ztvueMVJEJAC1AJjh/aLjN/yFYMvLc/M/qZzkG7fw8=;
        b=XajnCaHNgRrjLzelvEFMHWmAE0ioJnPVlb50D04zvk2RPNQ6AU8N//xnSTLrhzSwn2
         /2a9fyWe+48a04CxYLCobduJBeFktSm3y/FvctRfZOjpA1AJMbEVLMMb4PtV8t/A4Wew
         VDaq1liTbYg+zERtQLeBp9GxxHzaK2dZh6v8owqeDFItTNelU+dR+q5FuSqWDD/eO/dR
         SsHTRM8j7VWL2AUu7GjmH30b8NsZ5iSJ8OUltfein43bgB6OsH9EeVLGHgjTd1wCeQAo
         ePRRT2M1B28g2t9CLJVLB+s4BWhVCZ6T/iYLZyOGEkbLb5fXln4NPyvzRo2mdttMKV4V
         ew9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804585; x=1785409385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ztvueMVJEJAC1AJjh/aLjN/yFYMvLc/M/qZzkG7fw8=;
        b=H4pkpUjTpqqa496DqhinsukDx82zLWKzwhMq+RX4wcgW1e4/Xbt66D9ZqB512Vkzf/
         V6CJakgDLH4mlsOuk1Rm5BNEFuJ0MPdSQRBNQszi96VMzNUwN+lQJ4/BDLtbIagJuBSF
         ucES5rEpRtRmzGxRGD/WfGGK+E+g+xgfsvOU5eze7V5cM3Vh7BKrhtWoI2+5EzMIQF3y
         Vn/Kr1vFh95OOaSTIICnYoditZw7aHmVYpnzD4iuIrE5UJnKsYj0V5awc0zn/8KTNW+G
         NXbKGSvFcKFP/6CMEgqRq9EiFFPdXtC9+MeArcUBMK1TNTEsNpHlKyvXNr3haD0B7Qg0
         olzQ==
X-Gm-Message-State: AOJu0YzeJAfX2iw0AGQHJakPYNYesvBRQvL/jfa4bpXAdThikE/dsCtY
	KpeEW2Pc0vR7cEt6eOcVSHFmi2VZI30mTHvQ0MhEWymQQHDfZWIuiD9zg58UHZbQ+u7GwXnhq3n
	9DDVZgJStqysIEuoPyDRjXDMfojddvnDavmgQm0OM8XocwxXiYgJJhEHBlu3VwJBuUEh6
X-Gm-Gg: AR+sD13P4HQaC9bAI1+wI1nU1VZtuFNjOSOJiqCd/PVwRl1gjQngO3QC8TGPrdavBkF
	Ow0Daf6b1wCPCw8Y1cGyyCiXN9WAgYFa3OuVej9EQ1sB3hpsQYcue2Jvw90Ad5r/mMMLn3nRt0d
	oDSPHLTgyBBLzlPbYVTH0qErS0gtSFrUD7GKG2HvhHQg+rlQjzIy6F06MgnXIG8rN2JIk52vi0b
	S7J1xHWspHshuAMfTxzYgrwVFo4HbzJQgpCKf9nKkDtFnoF6++w8jUhLCq421OMXhu6MCrWguKd
	bOIHEn/FoL0n79GddlOmVgM/NSZjK9RpOkgLDlGppmVuo3FVRn3uJySxziQd4KsRhxIeky14Ofi
	f5ag+YYSy/HKdNg3zh9SYL+Nb
X-Received: by 2002:a05:6102:644d:b0:740:177:fddb with SMTP id ada2fe7eead31-74d61809a38mr271916137.7.1784804584711;
        Thu, 23 Jul 2026 04:03:04 -0700 (PDT)
X-Received: by 2002:a05:6102:644d:b0:740:177:fddb with SMTP id ada2fe7eead31-74d61809a38mr271893137.7.1784804584069;
        Thu, 23 Jul 2026 04:03:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac9d79sm214302966b.21.2026.07.23.04.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:03:03 -0700 (PDT)
Message-ID: <970cbeee-df24-434e-8d16-4131a978a477@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:03:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: Add compatible to the
 PCIe Root Port
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
 <20260723-hamoa-m2-dts-v2-v2-2-82254ac101fb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-hamoa-m2-dts-v2-v2-2-82254ac101fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61f4ef cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=b08uAuFw51IagC8vmBQA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: QC7ZS-eyC6j_z_xMsN44Jbc4hB0JpKCI
X-Proofpoint-GUID: QC7ZS-eyC6j_z_xMsN44Jbc4hB0JpKCI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfXwgw0uSotqST4
 J/Tv0NLDJUrjRyvXRvdTPKYI0BJoK7vEghIUtbhb+he5yMuBi+6oPY/EdkEVcZ3fXwCqlnVWJsI
 SlkBWuLS0oLmkQhDQuW7Q2iaFmAf8WI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX7gUpuZA85T3Z
 2TU8SUb+BxzdLYfPt9obhYj1cmzld7yDtb6N/4jS5AfxsbV1g5ukpIuyQ7/jnTKg9zZHe1ZLOdW
 lEh173RYSjtZkeNEc10hgncZfvsHUlwBADht9Pvheofx5/EuS2uHWTjm9CEo/WJT0M4nmgXWFhG
 INUJt9YJFX6IPOtA1589bIy53iCwnRzIxrd2OKS9fkA32sNtbdAqk9NpLWxMIfjjt9+kbf6WRRP
 zI51qbdysfyZ7EYyy1gUxPXYY3zEOhmt3HyAGWQrxSbZwLE/UESxjS9EySp/xsCXhYtk2a65IPB
 qegqFRXa+HsVrXI20NdgxkK0Pa5cDzmeRGzze7RScReFPs7f5p9QGQ7UhvAUnImywHcUkjOtYRr
 STIMFGK/xo9bygel4njGzME0Sd6PfB8aNeVP5BJ5pfC4mUkc4n8Pbtq3GrmA7ya0V/cpfjY7sno
 r+9hY1hG8MKVyceOKDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230108

On 7/23/26 11:56 AM, Wei Deng wrote:
> Add 'compatible = "pciclass,0604"' to the pcie4_port0 node in hamoa.dtsi
> to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
> bridge device, which is required for M.2 connector graph endpoint
> association.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
