Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6E949AA36
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726141; cv=none; b=jzDLgOn+V47k/LTGxeWIvwykG75EdvJ19Rm6MAHM9I9oXD3rRmDeuIizAUWE60WWQaXt7YBN//tdoWD+xMX4+IPIQkWgU3JwxzgWMr0Y2twpVWX72yO74UsSFa1I62/f5Iod+PMLz4t0me1aZvvSisxtYgM/EWoZM6KkRDbTYoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726141; c=relaxed/simple;
	bh=ZiS873j/oX4o0aNS8BJNpSSXLtLM/p/xUhBTa/EQMmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyRx/Ya9PwP8FyHe4RMM4syamyCcPMFXOFHvN1cWl6ZED42WGWvj5T25R0F+8y7/X6n8fyUp2Rqapp/umrPxmWwgMOB87QMLjBLc5Wnb2zpmiaOC3zvIMC6npoWMjetgjiBTgkWXOOQlRSlDGIqU6lFdEiREdLs17UjdQAvsHuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=By7OpPZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOmSHNl6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="By7OpPZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOmSHNl6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dOY13746740
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQNBrq3TGaVn7wbkyIZv4RT34n+BbDeNfTBJBIwEyMw=; b=By7OpPZpVeP/Ps/P
	RWJ/EeQrJh0bKODkyv6SirZp4yBXO3vegwDBncqCzY6rG8wocre3Mc2whgUWFZJP
	GeIaW4B6DaWDy4BmgtEp5dO1cBDYsRoqjekRyxQYW2OPzp1f3yqOz32OpN/bMQd3
	BE7ta8+CCV/lZWr9U0f6nd36BD94C9qJ5H6oppBwGXHz+1y7MMwF+LD3Qfin6D4i
	m5XOkvCotPfC0Zt3sfC/zGnfgaqCgIwIbNGU8zcyyoG2DQjSCIst66wGAE2g903Q
	5l/3NiTG/JHGKG6GGYB+OzMTBd78tkxhVHA6goNTw61WHMfuPjeb7KfmgFoq21zw
	y9dMdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5kmgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:08:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d0caso12870385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726137; x=1790330937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQNBrq3TGaVn7wbkyIZv4RT34n+BbDeNfTBJBIwEyMw=;
        b=NOmSHNl6ZK54KZ2VeETR0Z52EQGHM3RUGwrknWqPFzicqFLHXayuiFZGCf4NjOQIat
         l7xLvQYOIP5MAJREMxsWJeVqegRN54+UlcXeLjxgZ8DtlFw4FErML1heu61+UjmnxyPR
         N92WpopPrpgBPlZK6NcfrCDaRoOtRDEDdAlnB8JX8u1IyYpw0FjlfwIEy+UC+QV37jy8
         xYAlkZ3Jzj5shdvPcMq+bNcK5WqFzCyCADiKJMyj6hDPNrbHgWXob9NPBUQVFLGvZaHM
         cRbIM94YD2KhnkVw9Y5uf0o67ohszLVhS+UUagGA5f9VL6YfHq0tVoTsNPTD0pdYPVGB
         wDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726137; x=1790330937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQNBrq3TGaVn7wbkyIZv4RT34n+BbDeNfTBJBIwEyMw=;
        b=N/IsakAtbUs7FUArfQeOE3rJ+muY+qOLUTwtipiLecbzJPxy86WB0iSz58bKFvTUUT
         m3dDebmjrhV9/2RMl2XScDHt75Wdr11AcI6h07NkWwfbcj0TmSSLm9xxAD0nr7pZW4HE
         9Su2T1L+PII+bn0pjITw+9PL4FCtA0StuiQXl87xzYJ2O0DeRUA2uOiqYVIizSjPYz5k
         xB7rlLMdD3ADQxbDwrTsyQCXgbyylI/+SCALd8p649di9iA2qa4xYXyn+fMG9MBIHOK3
         UpahMqz4cVXN9NIo+JVI16V24REBmxFgzRTQhNR74MbYF1g9QGoahTEWbC+0FNloWkB9
         kU7A==
X-Gm-Message-State: AFuF++l66VLtTEi9agU3nr8WBLrPSKqIttzzbL3zHhuDQccODIhLcwIV
	AU9i3GnupeXf0FsNaXQ5UMnwQFdiu2cVkvpswjluvQ5R0tbX2UmsVnq7LmlKzLb8g41UPH2GdUS
	Gz33YaTdZiDAu3BMPdwp8Cvn2CyghX6coyKnBl4axHWOO+W5ncaRhfxlMMUjWh6lGACs4
X-Gm-Gg: AYBFou1lqguDavrc1UsXHdpmQcdkbWrBNumSRIJtoMKS3REOL3WF+gtWsxSqj3wm/Lo
	GCyHwHMznkqkVCEgGLTIXEbT97Y/ROGBd5WDEsKHzfo86jGUzUia/FEZNPz7F/NFVoZJ71xwlIl
	Siyp4jwmX1IfltoqcuuAdVZQAySoelqhJZTyeJ47733kIU91PNQpV4JHwQbpjS3SjNJ+f+zCa/T
	Mvs+9PkLR0XgT1B4KIOsq8pyqm/hZzhFwg0P5u5z/o3YbsMmeSuTKqP5uYvZdT8erk2VWXkXbjE
	Rc1ysPA71INf6RSV7UgUFnEzVaIBgdO+DqvrnJwvwP74FW8Meioq2sxmQ8oO0sMDU0WAEzCJzbh
	we3UVPGtq0KBK31Z9M4SdQA==
X-Received: by 2002:a05:620a:7086:b0:939:c8b8:4639 with SMTP id af79cd13be357-93be0743055mr182388185a.4.1789726137239;
        Fri, 18 Sep 2026 03:08:57 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:939:c8b8:4639 with SMTP id af79cd13be357-93be0743055mr182384085a.4.1789726136760;
        Fri, 18 Sep 2026 03:08:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59762eb7sm610295a12.24.2026.09.18.03.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:08:55 -0700 (PDT)
Message-ID: <e7351e2f-fd9d-419a-b274-abdb842bde20@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:08:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: msm8996: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-13-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-13-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX4JR2geF0G2f4
 DS/NRCs/nEN0k0xGYENJIGcgkn5nk/nLtce4ZgcJQ01hfm0d263bWCS6mlpjpznZb8fWYWST1oD
 0Svf9hMynbtP73I/leo3FQ+BDXxU4AvS698n8c0rbS9xGirCLSGMcmFYKSNju4/uATVYB8A+j2r
 HD0FF79KvrmSmA2M00+il2Da4XaVGRqg6NjtY8bUW66ZwPYNWAKf+3gWKe401EY0rdExmWCXygN
 459hYF9z/ew+a8jOj7FMgs/FqCrgHXtqDnJ+MisYJcaMncc8zMUqjetjrErh2+IUKQ4SpWienOK
 +Kj2AwuJWHBC21rWPwTA8YgwXRMkYIKb2ZmB10JYwOliXyvBCnpzA1nUoSDazAnlZkeDrSSqTpz
 og6hPjTBlG98yXANMbqFTa4RdD+pL+46c+hgrT/kNBOl4mZL5NZdr1coaNCkIXEXCJ9QGMvK1zs
 khXsqFa771pz6XkMWpQ==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aad0dba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: FiZGi_jnhnD2c7qAmYr_xdlEWNyDDUea
X-Proofpoint-GUID: FiZGi_jnhnD2c7qAmYr_xdlEWNyDDUea
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX7FT2IXRf0Lw2
 jq3J9yRWhvF58NqX491ygkRgtRIQm328Y8UZAvnARIMBBZ6Ihc4JuUY/CSdWLQtweTMTtt1drC1
 6rTxo/5Bgfn7s6P2XpSSFkbm0Lshrbo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, and pcie2_port0, adding labels to these
> nodes to allow board-level overrides. Move perst-gpios/wake-gpios
> from the controller overrides to the respective port nodes in the
> board files, renaming perst-gpios to reset-gpios to match the binding
> used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
