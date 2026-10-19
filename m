Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8379B48FF8D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400835; cv=none; b=hL/wal1wxP9nQRLJRwiDMnMkTPZ/jAGkEgh0JBxLfjjX3jyVRC+7JVAaoR+6KFwsMOqgzf4VnNUDRnwHLbVvkCkX3q9vUlDOLUKa3lc/tlG3Qkd9F4j9RhCXY0g1ZFBic3OHitRNt/BXsQpTHuXkRSj0CHjkQKZBnLWNY99upF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400835; c=relaxed/simple;
	bh=QiTiJjMnJoygnfwW3obAIo67pZvKlE4o8Z9bHfK8l2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBeUT4yGWXxdm2+F06IvdJW5qoSGARWdYBAmMh1MkPci+clsRrVT+DfYI7o4tuOazq/W7GbzeMOMTdQBzpLRz3+vQx4EoMEpeJibXkqfJ6F5oVibBdp5LCM0vqqJomqXxHTmtqkh3aJA8cENt6D2vP47T84M42t3BadQ3BoVrmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1qdvTS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AW8kBTsA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1qdvTS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AW8kBTsA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8YoM02688910
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbtKVob68BJTKeYL/uFMdxIGZINaQR1gA6bOavXivEI=; b=H1qdvTS1gEMHnE9e
	7cn+ABxl4BSGpqY0Pp1SDKiTznKs2paoLAYfPus3JWuF33vg7uXnBl0fOxfPG+7x
	Uc+CUNpGw2L05vgcun8IllXs0Jjbi7DHcRcXbrHuYoqGRuEQYez9y1N5/mXokMHr
	IVy8qfUP6C1UxBB85PHX87sty6GWV8qw0Jg435FJ/pcQojn8rx2lXCfSPff/7SPP
	HGA9nGO8GSF+nF2lDHqu9N/3VN1ZIeGBtdpHgjXl5xWHA/YcLbiqRtLhI/h+wcOQ
	xMhQuAkqeU0CDiveH9oESKYbp4WARLPRlku/HN7ubEj5uNz//ZmZRCAPDye74Qcp
	6SunjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn042v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:07:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e58614290so26620985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792400833; x=1793005633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbtKVob68BJTKeYL/uFMdxIGZINaQR1gA6bOavXivEI=;
        b=AW8kBTsA4qwPojRoYWPy/Jhnmhv6df+DP58s7vBPY9BJvvBC0m34cb8Ec+4TmtFLR2
         a5yBmdJ28sJgCB5p52uv2LWUPKzUOVTwhhXtf6SL5k19RXJVv7LATq0/+OFKehbXgLwY
         TGix9lP4fh8h3zNChNAA4eBDa7BPrLi3KhG1wm9PBDjiuL1gfIx6GCMAhi72y0/ZWXJT
         dYanR2vbCY+ThV6IcvcVyMaO1nvs17LPBmhm7ol/WpqIZr6ujlvF1aAeX5yYhkj43+23
         baQuj1v4wbOgnxKzfiPgSp3rjXSQDh30+pdx0D6+JouLwVZRnxDlPceKFEAEBottkeQ6
         nBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400833; x=1793005633;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbtKVob68BJTKeYL/uFMdxIGZINaQR1gA6bOavXivEI=;
        b=0EA69i/t2QgWq8XwDSzVkRzMFXnKigGn6zkBUwIOZW+5nkbE+HR0MZ9W1fPYwmJ2al
         luS76gdrMTj5f+XkVwmAmr7s1UkZI3+/6tTsAOzAPyB8S2knw+CQFdA8JTuLCNxqsM9Z
         rkxhJgAoGJGEl/fSqjiI/tPTXtbf3TadMT/hVD+Sr2jZcdfCOMVU4P82Y/g/DWDnaiXV
         zIq9VhEy1DVYjK1Y0ncDWEmy5WVSbX5kQ6TW5tTAwwzOQ0qloAOkT8nSa3fdKrDyZ7GK
         /rEb8ikUYEMDQjS2e24NfUa7/sJQJJBJ90ksVb4RWCS1e+tmHZWTFJUpSHSt9+03vIVz
         xGow==
X-Forwarded-Encrypted: i=1; AKwUvBx2ZBs2RSqKWjTqNjCIntl4ITdWrAzVmOXJpdYPD44Q65VLfu8MLoaA4X9D+X9Bi1Eg3bKPmvTvbqO0o16q@vger.kernel.org
X-Gm-Message-State: AFq9FYILmoDAUD9CpbqTMLafl0zkAmiW4yITZZwbYKq+gBfGdYoDlgJP
	LsM2tc+yZDmygB34uK8s7nHyl32MMuWjzyPe04a6K9VYuWsW260FaW5HUPMpiksG7Et4gcEApQ9
	D/3AHWP+HxCP/W6yvprLGLynDOeVigSFyHmial2czdXm7KpU4NLCzce5vbwz2vxhEN/NM
X-Gm-Gg: AYBFou1Fk0Hp0FI+RVmGPxksI0L1zpqwyBugAf8BAb5ZrFWHJrxSTpwzXj/ECy9X3TW
	jWmIDR/VohYIipv4E66IP7KCIPCJQHpaeYhvxEZ4IyB0OC27uV0dC+Nh4VXpZE+5x4QwmkmE/DP
	7gG/mKlDgBZ5YfOscy+xkAqnxfaHJV2sMAzxPJofoTJk/AuUal87dF8fGWT8MpQp2mYHsedP9kv
	jM3LDsbnJEBOyPMOmTaTxRppSEi3tHJsyxsTbu7bmsTKMdqG8TA1pthjBVdwaAo6BTmU/ocduU1
	pc7l3tO8+s6Ea5shoZC1ymBiBNjkr/yNquZ1EHn4PsZnn9rDI/PYIQaMWravkZuTJZAwZwtWIyu
	Yzf5PkUkL7LPPtF9FkxwwNQ==
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1378749685a.4.1792400832681;
        Mon, 19 Oct 2026 02:07:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1378746585a.4.1792400832262;
        Mon, 19 Oct 2026 02:07:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d66d6sm3577256a12.23.2026.10.19.02.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:07:10 -0700 (PDT)
Message-ID: <5fb55e28-b04c-4e18-a80c-2f2bb90f13c3@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:07:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Set
 snps,resume-hs-terminations for USB controller
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX0plCuhD5/eW1
 lAHdxA8uHQlO5o8SGjmBmrbnKoat4sYmCLRij3C8MOKlhOndvpP6hCc4qxLT0JDrXr4Zj+e1jMN
 jdDuBiwLH0+tOooPFhrOfUj/pmfnTw8=
X-Proofpoint-GUID: Ab1GjiKBPYpwst4pvfBCLDLRGaGFFHqi
X-Proofpoint-ORIG-GUID: Ab1GjiKBPYpwst4pvfBCLDLRGaGFFHqi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX2W6+leEyawlr
 Fk64nIVVKYg+ZBEr7aPl/RcN7dCihr9h3eQcqlCzsTm+InehrKdRz2MSehX8hjrs5bbuEdwTNaz
 wH0GvqSa65jn2/pP4IpfYmDPE2T6hOxOFtLGzKxBDbs8ny6Nit1WvitAp3U6Na1KaZUTsI7bDr9
 325ALBSar60pjXTE7JOh10yFtqiAmEdpZaU8v8pCmfEpPkLJGbGoxGGO2EyUZOY5nlvsAJ8Nox+
 qZ3LF7g0QeOzRDRJrUuu5TpgGSdh2Wa2WCUXewXxpR+RQmWC3JwuK3WSXk5hW8LT7ave2zMI6bQ
 AuQ6CDWMuDxAjipe0xS9JSqFPkrpyKMPjV4G0LtWre46KGp+Hx6k8Das5DW/fm2clMVpTC9peZP
 aftM4sEU/BHV9yAAWMZRSkZ29jgorX0+BzcSnYKl26bvMZqERzGpVuJ3jouHCMvN6hVkco7brwd
 2Yy+CjR9sE0/Av/ir7w==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad5ddc1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bd4qqj497OEF_3r0wXwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190036

On 10/19/26 4:15 AM, Peter Chen wrote:
> The DWC3 controller on Kaanapali is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the Kaanapali USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Fixes: 3d395de80a46 ("arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
