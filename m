Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5079D485502
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450560; cv=none; b=YgcAx1GBuM8eZI/U6xBEY/jGryOM7umEt3vWTKCIVBC6jOjz+SIk0R6tYUhJYI3txls9mhFqBM2rVia3i7Km5MYJdsJRwGd1P/QrqcxG6/kxorfL7YvusFPLLJYn1OTzcvVNR52aLRWiPsaTDmxVtdz5nVDcIjPoZ/vVpdPTlpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450560; c=relaxed/simple;
	bh=codICaEdp0qYugty23BI46Y/NC2M9dOLtRVF9r6NWNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWVueeaXDKAgqRl0h/AWyI2Tyd95Q9AQGHXZnDGAY7nxOcEVZrEFHy7c3KxeLQhJq7sLI1kCakRv4a6/t8g735Qbu4jN9ukR6K/dS+1I2RMwH5qXPgXq0hetVJi3vUxE4VzToMh+90HTriSOS+ILcYQRVW8YYFi0NrHC9w8ngD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SB6V9DkY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WosuMg0z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SB6V9DkY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WosuMg0z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KRJP1846371
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 09:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAjto0isROG6r68KXH8GRJqJeGgu2tcQNi03PKzPdiI=; b=SB6V9DkYAoSFiEaf
	fgi9NqFxXXY+wTMtMzHKk8MNnMufQPEpAR90ZOaDBQeamxYmXG2w2e6YEy5GM4h+
	v27UYJcEECTBBfU3W4+N3JKSpDtLZFD6vpHkNikWazK20QD7BTjWk2gO5zq5Xg+n
	gXj2K13JFwidSCb4C9OPpZjasy5w9P1vn3SfhBntHtzFOMuAy2g+caNH30UbUouu
	7/w2tKA/m4hZtEXkMfM8wG6LtFqzpfkK7xR6bTatw41NRYwQVnO4pLpSsemBSpO2
	qH10h5cPhXhxYs9dtGu7Uu945ODBhxDW7UyHJ3QcZH1Xxj8He3zrjZwCenEt6ffZ
	XJZgYw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3j61n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 09:09:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-352aa273625so213232eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 02:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450549; x=1792055349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAjto0isROG6r68KXH8GRJqJeGgu2tcQNi03PKzPdiI=;
        b=WosuMg0zKstyORVKhoxRiL+8CU+5cL5EOdHpCwOr1z6rUhnfThbZRQ6sJMx98NWsWu
         JOlrIk5+7vw9KiVdfO6xInlLNTV6EJpli22zn/2muYL1ouuo8ucql9CVlNpSZkACWsfo
         kSHcOdJnUHJKZ2O8y3n9T4Rioef7/UMdtmpP9vhbSvSFSFYX2XMIsrAL+iarc9l3dv/g
         Pm93ey03QavPh2FV8S14LCtyfZjwRMXtv1IUjJTL13wVWciLEvPd/AdWIGPFXEBBTWCq
         XsyUZtbikEKCufEUtjquJTmOIhBT7QDFilGBR8atVMBbeqWOBUPcfk0zJ2diSgEVDkex
         GTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450549; x=1792055349;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAjto0isROG6r68KXH8GRJqJeGgu2tcQNi03PKzPdiI=;
        b=ycdO7IrCDPGQ1Tfo+dPr2Vp0kLpflKyOkREE07wjjVcntMkHVqIxpxlticuN4/lnEd
         EqegRS6sc6eJ9o/OhlhWe3D7DScY5Q8VsVy4TvJ6Sxg0ligKW1QdE7J3h31emlLD0AKk
         r5gA1OBD3TTRi+duRuDhMnjHuVe8S75LDOz5vnXTJ8sxaGYKcc6jJEERRsQUDDNJ1OAw
         6S3fFokw5O91vlxQPS4XT5EfOLLjxPld/kZkyp3q99edWTsHp/L3J0Hp9JOUuuTZvERP
         3jWSulhUGLIjWvpiDCTyhJzutRt37dJnI/4F5J1CabE2xs7s50SVq7+5dQocUFe8H0df
         Qk9g==
X-Forwarded-Encrypted: i=1; AKwUvBzAfmUsRikS2Sx36DNqT0e88uv2gJ3LWcPb1jEXhqbKKkO1KrkyUiabZKhcb0+btw8IL1pxEfMek+de7KUl@vger.kernel.org
X-Gm-Message-State: AFuF++nW0q7+rmcy0TJzihNEi+UdejGh1PPvL+kGGv6RDpNrHgcyVXK+
	H9jtnZCdHuOTPN+PqMo+KrGD4tdP1s3gr4B77ud8AxXEDljftbl9bEDM9ctr/KgNpcUKuU57Oa8
	rATF6xqG6AYQAgGrDzhOgzvdAveQ/mRBcMHlWNNkRUCMFMM/FWuFWZMUxHBNBZ0LmlMS0
X-Gm-Gg: AYBFou2PkwX6d7aG38VQIOCM+2sof0xpCOGecUGh7vKrWjl2Pa+WkLiuHFZGK2Pitki
	HJw5mnsEt+94tdtrIst8/3GIfeayu/qIAXBN+bMaFkAFHlUYM1EL44BPVJ/NNa9OlOGKxPQvhw2
	X1jKZlnSOPT7WT315oSrhcsTB8CWvprgBUrQWtxDRLjou5MIf8KQeMiAlhGyvRWOdMyK9vUP7PT
	14iL3Mz+nKktVYYmIoRUBacDKUhBeV2mW7Udge8b64/yz4VoE91M1WKvJRxB2fwjFpSdDqvxp0n
	FAjn94lNDqb5VDgvPnhuSoQsxruG9T4wev6zMm0m9SgNjB01U/rSvuGUC6FFk3cR0TtVe82j+6Y
	kBo4YVvWSUqajlGKXFvY9Q6n40N8=
X-Received: by 2002:a05:7301:105:b0:351:27bb:271f with SMTP id 5a478bee46e88-3515dd4c451mr5174781eec.11.1791450544002;
        Thu, 08 Oct 2026 02:09:04 -0700 (PDT)
X-Received: by 2002:a05:7301:105:b0:351:27bb:271f with SMTP id 5a478bee46e88-3515dd4c451mr5174578eec.11.1791450538615;
        Thu, 08 Oct 2026 02:08:58 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af90521sm25647665eec.19.2026.10.08.02.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:08:58 -0700 (PDT)
Message-ID: <5b895ba8-5873-4576-9abb-2130b46431ae@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:38:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark tpdm_dcc device as failed
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008-remove_tpdm_dcc_device-v1-1-48574c6ae6c2@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261008-remove_tpdm_dcc_device-v1-1-48574c6ae6c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX6Sms+/unH1qg
 dkIuo6ViKvBmB4d5UWUF91IF5Mu1EsgZ7tAC7QfVxBix0YZldHRmQN/xSMJq72R79exRVtApEQf
 qZ1WLjSCB4DOQXkUuECEIvL+l5vMrKk=
X-Proofpoint-ORIG-GUID: eRTiR6KYUprKLDx0vNfwM_gy4-5efI8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX9vR/69kPRXmB
 6jXpD3/cQ3AfK4ZupId9HYQY2TNLpnUxOhgPtjUYcG3m0i+wuqCcYFotSvFgGkSSLFoylexcRej
 uvxwCNY+o/7+iWLOuuKImBW2f7Vo38wGF6Xy5nqJYsm/d1NmpVHenQykLYSKmBNFwxmyjhnDFKY
 Wnc2Lj3oGBnrXXSoXSoApGDgVZNtkhqne1oSfJ7X2Qh+ue+drip6tnoF0Rfv3zCPgXDS4/mekwv
 yy14pGDJfscKEQW8saXNI/g7BzjE2vWXJMKrMn4jklcXSf2gnHmRCMbvI8Znp3xyivyvZt3da0a
 a7LtzW3my+xWkTKpBXL7ba+3iVRx8gt7xuwWqDmcPVuGiTwvkS5Qm5UlRO0wMdoAPTl0q0qkeXh
 7jr4nxPmiLz1s/2wTssS4jIODrg1X/yCznHrzO3Bx7LQ3BXVuX+mvcL7TqumtAt6MoXIeqrRiG7
 Mp1qLV/96XjKj3UfjRQ==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac75db6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mwqT9ZDZRjcqunfB_n4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: eRTiR6KYUprKLDx0vNfwM_gy4-5efI8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

On 10/8/2026 11:38 AM, Jie Gan wrote:
> The tpdm_dcc device cannot work properly on secure devices because its
> required clock cannot be enabled due to a hardware issue. Mark the
> node with status = "fail" to reflect this.
>
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
