Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A811C49739F
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658200; cv=none; b=EfvT99+5Z3oVm8UAY2ILUvFGNNPQr3Ueq7UwjBHFrD7yLZTzJflfFoTCA6XDgTDkfOzhVKqD30IF3WUuyKygXJUa7mD/drE8p9psU1bYiPZVBwocfLQ0iNHpxS5UwGy/BmUlylaw4GKQFREfqudDCHXm2wfF1owwe1now/K915k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658200; c=relaxed/simple;
	bh=56YorWiGBs8GPX5AuG+hYmp5JOZCucSee0bUTwtH2PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLlnYmnFl1Gfq3ODqxteu9CtLPWIjyBsZQLgVftVFjvrCHZUORuuSA5U5RPYZcGJDODu/TDIQJSQGkSlBlwgFVNk5+Fhhw5Gy/PP5USvqdCpjvrHPI5CvOtDm4MAT6fTMjsE13QmNkYBxvgDh2Iv0aTcg8mzyVcuzSs4YwARGl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6XU9agP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8OPPLLa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6XU9agP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8OPPLLa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDjdAu1307344
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EpSsv4tYPQPGZFy7t09RaRSZ
	W3uOSO6CNjaFKE1zqtw=; b=b6XU9agPGsJ4Me0qBNKXe7OnPT/s2DVpNnvEA5Vs
	0zHKr4EwzPryH8vOvaM3V5/PQxggTJZUh6n6vYIOAndSJsq/Bytw6V+ka/Dd8QMW
	173oP0kBhUob2H+H77Gibc5Wqw1PtmEiAe66K0vWlSDZSIPgwPWMVBkIdilXTfGX
	C8HthhHkk1bYFBW5KxE6CVuFt58tIdNtUwHaamioQDgE4dYJ43eGNvSDRTCJt4JS
	uZISYkyS0WVGSRd55+lAdIlHU6G0jH9c6iiKr4t/zlJXwML0i+7gEex9uH0qxre0
	x4VQMfHFyycuUZbyjLvLxbXGNJEDOjJIjbg0x49No2z64A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra9u70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:16:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a08ff8451so147741885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658185; x=1790262985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EpSsv4tYPQPGZFy7t09RaRSZW3uOSO6CNjaFKE1zqtw=;
        b=C8OPPLLaeHKz402I7i9GAN3zla/jTPF69yDe10y4JhKyT5nqRUE63I1ClR7N8oIfnX
         +ITpSS/aBC+zo0Zzc+4emk5XMOAgO1eTE1RLBjREdbV0mM5uhUE37XHTpWkhIRvW4dFR
         Xf9JFa83aQ7KFts0R/ZOGkSBXo6spPIxrXG3B5py3eF5JrniIIMJyRhrvNhZeZ1NrqvO
         +LjY6fCfBU2gGPOoLd+AIL8bjq/6TusiRIgVYc5sWIO2RWVScLROSE6FTaqB3jMds1Fv
         xLMD60D/5FSUGLlkfuI7QvG0ybSa1uXAZoGqB8p/pbp2wsYi0GnjwzzQLKYydzNhJf4R
         lg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658185; x=1790262985;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EpSsv4tYPQPGZFy7t09RaRSZW3uOSO6CNjaFKE1zqtw=;
        b=0yIyjVbKjJz5C2qjfy8qzzRu5HTvVv7889r7Pz6msgU8e64uZDYtY3P/I6KFIwp5OU
         lqxGJekNPQTTRbiubnMzq+R2/T1L5Tp2cZNF88PpS9wPqZsnqAfj/hD7eVMPxsOGQTad
         ySYN9BfuYxLFgm9owvZPbVqyo1pR7Zx8AHq6UZxcRa0Rorxdwz8afua6qkXHNfwG4QWu
         hVOUlEXWfcQG2NakoF2v+2MjoArle6AVPhlRMGZPBW4D6ho9u+UFdZrphO5NPpKdN5Oe
         5X0VtLgX3Ctjm+/E5SOSM06TULnIhKdvoJLlUXJD7DFgELCeETfzTcGo10KrgIVy6bxS
         o7FQ==
X-Forwarded-Encrypted: i=1; AKwUvByjX01ihFpJYWbxEB3L8qCHqpx0/rsYLWwEz1c0rxfofQrVk0rpmZmSNwk4+yk9QC/KLqpNM5l1O4iVZgCu@vger.kernel.org
X-Gm-Message-State: AFuF++lDFbaEpmmM0Zu478DTBaGkIXR0uf0Hsu66IglPS5+VvCgSr/yo
	0RYWc8/F90proMe5NhLUS4FgKKuSsgPnirD6IDXUk+WY31843fTLo0W3LO+tWqR7vQx4+7K9wIx
	2Q74aw7A3n4rOLdb+fzMxh3ky/EM2sLLu1eyTwBPiaEtGeINo1pL/GXBhx4kuAvuaE60q
X-Gm-Gg: AYBFou3NhRURCMfrc43MzUC1uELnIvb6dpN3i0PKwbsBvxmwfsEybOn2WgxTbKwRdMW
	b3+51RTo9JkIzSUqqXTGq3rJtMDxVOrvFWcDk807CjB+mK1w31E3uICs538PVa6jVyUpBsUzRtT
	7XkcC2bBcRqhzuUsKj5SW2uPIuISXuaaygYD4F3WNuoGDAtXfT0dlEE2rcSPnskMrAuxELvUUGa
	bXfDET8cHj6T5lRGjD7n5GHMp4uQA1m2K+jkrHaN5gd7InlJN6vHwTkURNTpZWYii41hrks/dA8
	TgPgLLoBh6hikIXmObOCnHeJwkq7lJHvxSy80Am+rpWMd5Y/cX5qB4Kl4PJ6ayM5Dq67BG4V2zF
	AAc42pJXZWEJDqg==
X-Received: by 2002:a05:620a:17a3:b0:939:8905:ce9b with SMTP id af79cd13be357-93bb77461a9mr1193762085a.17.1789658185210;
        Thu, 17 Sep 2026 08:16:25 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:939:8905:ce9b with SMTP id af79cd13be357-93bb77461a9mr1193753785a.17.1789658184518;
        Thu, 17 Sep 2026 08:16:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd776e1dsm43210625e9.1.2026.09.17.08.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:16:23 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:16:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 15/15] arm64: dts: qcom: sm8550: Move PCIe phy and
 GPIOs to root port node
Message-ID: <2gxtil7qz2f7jcshm5qfznv5tb6fvguafumgsiua3k7lyrt4dl@qp24s745okz4>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-15-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-15-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX0fxvknItJdb2
 RBgnuoC63uIoJZE3EwvpjG9uDgjWGZPjpxgmppTaqpbOXKUjNL3ZY/wHRQFoJCak5oeOE2joOTR
 xkAderLAfys8JE3Q/S87dAZBQbfZYx8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX0FC8Iw/4vDdQ
 /rxo0814qVfK4MBmyNR5a+oDXuSBWoXlZkzHhvG5bwRM8OZ78AA7AKjHCdCfEMk0Wn+1eIR0459
 7IEofhNtIDV1NJBbazVDrjkYNJwc2qv7cThrQRIonNal1Tt/+7INdRuudcwFiPPt1Rvvqv216Pu
 hhF3HvHQBVlh1oQbA56qDHpI/w833hQYvysbmc78Xh/3Ox1wcMLe4F2gAE8PfdpC25MuZQdvg1Y
 z2E0/9ydGyCQ+vJjB3sy7MaiPjSZy+oYYsrzr8wwFVD2FN8I4xnndxCciTqXYm/kHSWEaCjRyzO
 1txn7v2H1n44jM3UXDIp8/aa0eTuSukxqOYSpTYEHE4vhkXdmlNnlCFPen9Pw6LY07pQxkMTbTX
 ntCSFLtHASARQmGUDIwEb+2B/eHfarFhaRyFfUdICwAf/Dffxtlf9dBn+CeJXxdfvX+wCEByIeP
 qVzRiow5PEP2uPGk4Qw==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aac044a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FBOLNADHSRbf5m8Jq7OoGVcB13b5WopU
X-Proofpoint-ORIG-GUID: FBOLNADHSRbf5m8Jq7OoGVcB13b5WopU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170216

On 26-09-17 17:55:29, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
