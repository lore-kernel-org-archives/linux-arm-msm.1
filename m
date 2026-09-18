Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9997F30648C
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725995; cv=none; b=BQUrvExIJLjjK4sOT9Ou7jYGiczLCwpjF8AMUo+d9/l4mThhEGrx5068UGvLi26n9HskcfNN7wrLGXN7eH/BlR8nAXlhK59+VgKiPoDRJNu0e/HH1XE2Rgtfi4wqeWd0fLnLzNiy/ehtwDPpOGymHsyGa2Zmc0HDyBhS1XAsP98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725995; c=relaxed/simple;
	bh=+4eDn2NzzhI3HyTpGmtijFMvVz1tYjpIwkHEEAOy86o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0Hw3mcEOKiLWezIwbG/vtXZH+ZmvQLGivCt7yEZ6UWFwveJmtOwHnUP5WZkQqGdcVqmSgPxm92NA88Kc76pilTucfYN/1LiMXP3ni9tYsCWzqCQIR5JpL/jhmhS/lTHq/rgGePnyIvUXEYbpcjH/yvUv2YNyGPwb1++uXdpukw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQvYbaUC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FbtVxfSn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQvYbaUC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FbtVxfSn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dO9l250731
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWxVEc1wug8j2HVzSFOeUU1DSmmULUZJ8UhLvoPQoBc=; b=XQvYbaUCmJ7BteSI
	RzMGMtd1Hj2SsUQaiptT4gRh9Cys5MXbly7kC7QUKRQlz9lNQAoqrCodkAgBe4qS
	8sXn23TD60AGF3zEKpfOTguEZzuMbARJa5wd1h6N20zxNCZxobGw/hUMVfONwI4b
	zBlXXjKxDGTBEN25gznNyAnL2eRlNEJg3mvp/Mk/d5xIXhU1Bp52D9ZlleiLuaTV
	8EIsaoeulMT3+kTBGDOtQxc6iXT6ljhEo6G49ad4MSDOxmwLU2r78CMRgVlujMiG
	HaDxrK3OAUDVKDJf8nk6Cdom93eKy6/6f0BG2Ktthwj35HvKrngrUhA9XCb3XAv4
	wKZ3YQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2390agn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:06:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9103db79014so1393496d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725979; x=1790330779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWxVEc1wug8j2HVzSFOeUU1DSmmULUZJ8UhLvoPQoBc=;
        b=FbtVxfSnNzdO1c3WCV9bJMVL7NncK0Q+xImj0yCLEdKLXPq0ntPUDG6sNNQtKapBg2
         FvmxRi7FY6M87kTZ5rdpkbuMYQLliOqFbZIwW3bQ+5a/Ayw7aClA8fwH8IS9KxHJmtfx
         ircmjLmre3Fj9JyBmhPJIMkqu6zFReQtgEQUYpzfl1de9JFICOAw2sgTWuM4261spqiq
         qPHz+RRsvRWpTtI4L0ylOasyMGWswIaxasUguB68jfol73ysLdkgU++MoX04R+DWC/Tr
         A5+FxlhH+iTQ7+ieIVjL9xMpbmK4a+1ov3E0XHrPFDrcTz+lFtRkSMC6Kpy9Gi3mgROk
         KqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725979; x=1790330779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWxVEc1wug8j2HVzSFOeUU1DSmmULUZJ8UhLvoPQoBc=;
        b=D5Lkc2C7COgTISapPTROEozfz0vcui+h3y7hHcZKfoABu5G+GXLXKbJWwf0jdaWF6Y
         dfbIbUvFA0RVF9jfzUJtLUJEDUchegGt0F8phSj74b+1tODkmGXll7AFF/sTXL89oJe4
         OshBr4QL/nA1C3CupI1laoW/QNGdIal/4fJLVAA2krc4QSA2BXOQA1GNhsvuVhyz64kT
         FXd4GgdsC02MkV5yXEOdFmsms44XdBgUCcrY9c41+rLcBoZOnO7sp5YoX3lwlIuOy68E
         ggTpVvbfrSjvpIfEm7duCK2rHyumR9HZpdEIOFDbJr/Lv9gLv9WHZo53XYDyj7i3X1bG
         CcKw==
X-Gm-Message-State: AFuF++kdu+taiaH5t4OY7Vbrcv0szhmb99kVFKiZvWxs491th37Raktd
	t0OcTDm6LAmQzqfYIAiBIBN4K/ekEcpZ1QDsIKBE9UTo2eGjGrYUubuIyAf8vTHYg1JQuFPR7yp
	fE62TCZG1G+ZaWaRH0jeN85M5eCCU4AuGLehUBZV3X94moKvB0B30zPemXsh+MmS23aZC
X-Gm-Gg: AYBFou1pHCT/WuIWiDUEIfQ/otZkIzuIH5SUGuT+vtCiXKG2nUBuJYt9Oix2Uzr+6uU
	AtJwuTQoniOQGNBA4mVPC8Gaa+S/EOyISWVTeCMHpBmc2hZto5aNVnWU7zLlzc7cXFpk4BiV3cC
	DDE1/HcNuyMy9XBN8McfLsx437EdoVywu6Nz1RHEGbYW0QNiBYAm3t3xWaumurxy5Vpp7BCadEv
	Z/GBDUQVyluiWSTqKo72JHWoHDVATF5MuErNrEocdyDWYrrn/DAM+4QtxoVtIjZl8ri5j2DKSnF
	6T0XGNvVejHWk/sgFO139Q9o1cUeJshNS1y6QJqKhy+ubgmVFKsssFobLMfwhbZQ+qQw7yuHDYG
	xz5CI88eAhlrC/obcqo9B5Q==
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr193610985a.5.1789725979394;
        Fri, 18 Sep 2026 03:06:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr193607485a.5.1789725978966;
        Fri, 18 Sep 2026 03:06:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59715eb1sm618412a12.16.2026.09.18.03.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:06:17 -0700 (PDT)
Message-ID: <83244e82-1f2e-4b9a-a85f-1dc704a91c3d@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:06:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] arm64: dts: qcom: sm8150: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX5dE4y2r8vtAN
 WgHmFo6oBPaqnCQZLDxWutRf0O3UAjiDJreDwE2/w3JX+jKU0saqh54IQKIi8Olr0UpMaHV91DY
 0dOuSLhrm0ZZfQ3MoyFYnkiQFOsJ7Zs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX46nMBTye3Bdb
 7RzRmp3PQfRImWgqOyTuSqbxphBmG50B4wSfLTk8w0AlufAj2zbTj5iLB2fykBv0V3UTsGdmbX4
 2A3jdJXVRchARTYM8oSSESLOjeAY8kFqPvzdIl+LF4TlZnaIQ5ZPQEOf69y+P+WPXm94JSnHrX5
 yfWh+UXgyCMM8Cuz1OoFZvfA6kykrlA4mMev+bMo88pFUodNoOn4VogOVxkHvf9cgxhgF6k9eml
 dWf3FNyFeFkMv34aAiAddoN68oB8k00fbcEKHKAiTk0VbV4NekhnusEVx4HL5iLb8y4K+RwGDrH
 1uIDf+r3RA5UoJdEKJCCqeazP1PkEKaLWhHaEw/iuyy/QXTHFmWat16YDVZJXjIhIDlpDhZiCJg
 /lN966Rw9XIFI0Eo1sGBsQ/kFkefemVD4lXW3dKJ+0vnBfSe4pupMxQLdnIrMdX4ltM0OoWtaww
 ie5mUKOODL19m9W/1gw==
X-Proofpoint-ORIG-GUID: zIbAlM01rnQoSUhlcBtTp8aHdeUYmYuz
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad0d1b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uzxFZR7jdtxeiR6lyLMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: zIbAlM01rnQoSUhlcBtTp8aHdeUYmYuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to pcie0_port0 and pcie1_port0, adding labels to
> these nodes to allow board-level overrides, and renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]


> -			perst-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
>  			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;

I am mightily confused as to what this GPIO is.. bindings don't
explicitly allow it but don't seem to disallow it either?

Konrad
