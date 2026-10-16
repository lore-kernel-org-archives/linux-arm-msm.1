Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CE8470EA0
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161320; cv=none; b=jwCDNpn1M4m1RnduwYJxzz3WgChjNS5Viq5Z3sSIYZhCfKW2PteeXWd5rjzxsoQX88MQoxfUnko6lx9L05h+IdYq/e/CZfi00H6MCUhIROBCrbItONdfjNNLVpVX7ZlaMEvH+o72JjDMQTMBAoGuUchtc0l5LIyU4eFcu5g+gD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161320; c=relaxed/simple;
	bh=lTVEVyvxqPMEhLqNV+zfwjKh2AGmd5+/Os21Q0iXP9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7c8oD0NzSb2xV1s6TUyiHKcBCb9KOtf871WBhdZNk2cW6Vs+KT2sgA0jFb2v7GZJbJAp45PsIfzB0CIcYLM+E/7a/jv1XNBQf3zjbwDsmvlP2lvv+/f54N1GMVW4EYIYLf74x7BbOKlEC15WW0DeL9j0nzxajZhBCJA5dqcOYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfAw1sbB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHtYRXiZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfAw1sbB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHtYRXiZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5aPm1613241
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cIPFe0GbHM98hVhSZtxVKSxAcZVf/6T6nyXYDstJUcc=; b=SfAw1sbBMmBWkIqz
	7zB4256mNHB4FyBO/QoBTiqXiGlf74lFUBwtHgEhfCuNRMn+OzHYFvMpWpznAzxN
	BwkaWjonr8YLPTvck8wTngWI+cwf6NmDkrjsTlHxr/wLfk25gi1cwebMrNQyVIvR
	O14Glegsbh1xIncjfZMlalWSLw4lrxtLR3t9kLeH66wnvc5pArpbXnAellaKhwye
	LLnU+JL2VmFKl5ZiPMs1iXmI3ZQJPKifTYP5jaJznEO7v+iOV0KO+HLZMlpfphHL
	Sq0r18edjAVxXqDDQUUWkERaB7n9LBwntzEHwCOmz4lDMi3nORl72lw9kWXmK2m4
	d8pyyQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v0msg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:35:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so310985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792161318; x=1792766118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIPFe0GbHM98hVhSZtxVKSxAcZVf/6T6nyXYDstJUcc=;
        b=BHtYRXiZbiqCIZa5RHgSS3CG8kS4p3GDC/qyNz3G+nTyyqDxaCNwAtspWUXB5OoE4r
         VkSkEZFSio1xWzalZeVo95/8NmFHmMIjwRk8nk/csbdUDl//e8WjrN47GzGu2qFgvVV+
         1GgXjy741kkq9WRCYX+v/FmqO0ECAvrOq4pUrl24aXhaex1sSMfYw1Pajm5eHjQPamt5
         MQI3nyH3uATl4vYYtO8WpZXWfLZDvbpHZN3Ebt6MJIEOvMUkExJMMrJ+0h8pegDiwoq7
         lh5gt/wenXZXCvT774fJNQO36NUq9HCIOYj3jY2F46W0QW8g3qtb03zqUxcaDVAtVFoz
         68aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161318; x=1792766118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cIPFe0GbHM98hVhSZtxVKSxAcZVf/6T6nyXYDstJUcc=;
        b=UQe7jisgWrmVe2P0sZuMn/DuD1mWYpxZnG8xjgdfnh0fDJJxGfO6scVLUBaU/TyRqV
         ly/g9shidkppvNhaRZuvE+g7OFRqT+pLpQ2NoGWoaC22ynmgGTvXizaVq6Qbn0pHtIIo
         RXnrN1U27ps4hDeKCW99VIPfzxslunD+XT80mk4jmnfEivQbUZ92aS7L0Q2uMYMcVo4+
         77Ij5A6YSDzNe0WUujbkrB/qBrTJ1LcrO3mtKd3HrdGIdbDDjXu8T4K/RjaM+5/2w6v+
         SFLW8ehhEh8mlCQQtcpV57NtlrCylPxwwPaMbtr3Gw7DGSIKm1rRQx8Fz3sMpA2anwGV
         tTJg==
X-Forwarded-Encrypted: i=1; AKwUvBxnhEgKkX2TuM8tHc6FceyCxznjxx5KG9bszEfheXibw0TZSev+5KjpuDVyD0JIzh9J6DEA514D8tAxWBUi@vger.kernel.org
X-Gm-Message-State: AFq9FYKjPvz0xayvFx1hiw+L9NxslxJKs4Lm99C+pwrld+ijoyyP/dLy
	1Kq8VAedRQ3sB/69RNGiDYwGV1mhbr/5WD8aNko41+BmBT1Wm+GLWaubXC7SwAL6lyhjxqpQGt8
	PE48qodduTN1gUnKQiiTGu28VPyCo/ns9hrlZcKwKZIJzSpSijfGb0Bxxj+ZLa9aXvJswM5/073
	dJ
X-Gm-Gg: AYBFou3FY4ep4nhfyG3P2iz1yorADDx+RzzrOwCWkb4UwpOYx6KbZEglYB0ppg+zQ1w
	g8pS/y+UL2GsGmzFDIjdXt2IicO+i/881pBJwWWQqC0hHM/LjwWvFj6yQG7soD31QSCryTQeHJj
	rsdMOaeSuEFHI8r3IHDzGr/T0Zhorj3ZdsWQ0Ug4+WMPUeQxvpS7woD6YjYA4dzbSh/GN0tEDe3
	J+a4GJ3Lygk/jKzf3Tu90zwDmJ9fDEcSDd+YHnKhK7UReKCl7ZMzAILO8UHHm7eyGVIw1bbAXh3
	IkhOMZBEQIUTb5wqXv3M9cHsiMYfLOnUGB/lP3tjZdueKi2+8DqUgjcunvlR7A44TSrKDOpM6PK
	cg6DUsUDUmPTsESeeOEc5lw==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr3896585a.3.1792161317828;
        Fri, 16 Oct 2026 07:35:17 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr3887985a.3.1792161317042;
        Fri, 16 Oct 2026 07:35:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab16e8ca47sm5556891fa.25.2026.10.16.07.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:35:16 -0700 (PDT)
Message-ID: <3cb5c835-cdc2-4e36-9c0b-ff61ce3d768d@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:35:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: ipq5332: add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
 <20261002-imem_restart_reason-v2-3-61703c6362e3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-3-61703c6362e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1fiNYSW3e19q-xINhZ5WzNNFm9ti8Feu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX8il0PI2DeieN
 KYYgUx8oPOolnZ47tGxh3K0w8+D8v0rKHvCpWyYKRe4AySLPUAfEglIAWWy7qms+PGu7SMcwWQV
 fbV68fG2hy63tmxgi6yRQS89i4KjAeM=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad23627 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=owAxAYLDMf__z6yt7SIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfXyBDovX7WCyqh
 hSH4F+GFYswUttNYn7c8en+9TqcbX4iKld+IowgbuZfKhgGiefaBlGBogklodfmuNGKKz6+TFGY
 gt7MZjA0LDW6oOOtRy1kXTAU0/s+BI88PUw2M3PIFcUOhEzd0r6oeID+UdKVxB2rBF0KttiQLJq
 9a+AWxpnTlZYvbaMfMKdvrv8oLwjbW0r65gGjk8pWmHnOm1N5AvT6eI2araTi56dFmn6MidjbVv
 +oreB3czjbYUW/xq7gK3/nrD81WaKjxK0ODiFsxAeLEoy6v5rDuB0mvOrpMSch7ZRhr+PiXjrFF
 /NlFikwmt1NzUvAqF9cK1gd43LkIk9xz0Z7DbT+ZafuoVoUpWLYidDw66A3uXkz+ifaINKG8iSB
 GqHBenFpd0Y033R154PnM9gRWiGUsZ6zxHca93p/O4gqrBM4qPiz/T04WRwwKHUW4tLA0vfb+kS
 /icRfwgN0KcxYuDME9g==
X-Proofpoint-ORIG-GUID: 1fiNYSW3e19q-xINhZ5WzNNFm9ti8Feu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160058

On 10/2/26 3:03 PM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 80KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

This patch alone fails schema validation. Squash it with the later one.
Keep the per-platform split.

Konrad
