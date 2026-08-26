Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89472F7F1C
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734545; cv=none; b=cWj+Gj6ivubC4uZzm9+SjPCA/1564HxxGI2hADK6Scj53WNhfkXVVou8RaaE/zJGNjr9JFK4uwiJuQ8KfEo9pC+Cq0gbRo3QBXlyiuwxcg1Kl2NjfqqITGU3Ua8CIqhLR3GS06LsTPWmSsPdquJLzL51DD4VJgCSmrqsSfU1+Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734545; c=relaxed/simple;
	bh=jUBTa5V6MiiUVTdfxxQl8hrk26/+6hHOA0EmnRZKEnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ptC09N0MBeZ6GqbhuHVssJY37DOqCIiqKv8bJGEboAnQzgT3/EkPVSk5FCtTHgw/kejEtAWYTIB6uXEo3EnR16STc9aCqCEoHfU+FfSaRpA6YSICI/n3aRgpwaZ8PQzVUNaPLo3Sr/qTaJXE9GfSCbbmILevz0q4m4bOm0peRlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfEde3iI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEsuC35B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfEde3iI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WEsuC35B"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Ruag451449
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKUcKffH721xQ4fFLpjIIdKOL7fRy3HSldMJQVWs+VE=; b=JfEde3iIbZIZDlYe
	ZZK4OVdfVxgKPFjRZA/Sb0kAYsLsLDcsjQH/4qPGuJHtya+JG4G3giWYTaCOI7FI
	bedlm8aHutSlyPyH+y5HntxzpZXCRpV6yl0RbX6GgmQsnZwde33+u0e6hyMd1LMz
	I2wFVLOqwh9eUQ7kpVPcB2oXmg93VCWhPv4xLamOzFotuT8faRtOUzYdGzFS66g0
	YdnQWMynD3sFrK887yy/saNzXqZcKNztNzncoP2gWmvQyH/EgrIjL5/yIpP4vDRC
	0DwB7tFfjjQUTeNKNEXtI9LGzL3+azZGufOfbk7WDbTtht9kea7UwfL7p9h7zVvu
	iIjfHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1gh8wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:55:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so1577685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 01:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787734541; x=1788339341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKUcKffH721xQ4fFLpjIIdKOL7fRy3HSldMJQVWs+VE=;
        b=WEsuC35B4rlfbHVMx5hnhHP/tNWG1V0vxlcVPI1bQYC+gyb9Eqr3uiXvwdooaOZCWB
         24fYze8HvvxW/Gk51FvqpT+/q4aFA/Ceseu8ttALkmF3hYvyjql/tIxyKAvEpJ9Ji3dN
         3ZylpjVeO/vtjBmhZg61TTu076uwmkZeJQPOipUT5WIkkNmV1E77NeOz+i4l1w7+k870
         StFNOcXJdNtejBqeY4Qgbz9CkVWnVn4wC+1EeltPX30Ui3dRoGLfVdGHMAjbCRQCKoKu
         jmD4hUN7Gxk80KEZqF4qo+Z7YYnZjGhQiGsAFM5vwsv6v/I9YcDuBbJOxqm9P1mgVr2j
         FVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734541; x=1788339341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKUcKffH721xQ4fFLpjIIdKOL7fRy3HSldMJQVWs+VE=;
        b=nIa3w8ZUFOF93b/W6MIebfCxK0hnOgEIGWZgkIzoWu1IWUYngyo9MNSKgqIQYQtC3I
         Ho10iMZjpw81N3i0w1c7TYmmdzBc772DbNjYZawdVuNDOfoj00x7Sn1KMyNtQF7C/W/f
         xH5kg+CDvYvnCsxZ2jZ/YRpte0jE0Ss/n+qwia27Nl/sqv+AXGvU9EQPEIP0A2qrcBoA
         df/a2M+7JM6TQdb8uy7uMNuxmsTEGnE9jukS/jD4KDkk8y8mKtuhebo3QJ9d5uyntGCe
         zZvs8bp3ABFVnurc3ONJxe4aiAuWhBr9QEfO9bfmCuIFUfGRTH8VCmMhJ+2P5GP6SKzQ
         Ng0A==
X-Forwarded-Encrypted: i=1; AHgh+RpSk4oxUYIAbUHeCxEDtEHleYWSR2Um/U0LeiL49paJzg6OzTxKfl9zRZos1Ky/AzGLX63p798RA9h6BKh/@vger.kernel.org
X-Gm-Message-State: AFuF++lNpwZWk56Rqd0MA6z7Ug2YlWdD9Zv1WC8BwzGb6SY0gJKDLEhQ
	dfRk3Nq93hDp67w7dgtr1HNc7pUBc0VUwgkTl1gJsvll1YWV0YOnJKwDnXE2R2vDvI5jQhUDig/
	OBMTMNDI3j6QLFRKL8O8DJ3yqFeCnOSSksx2CPeaIxzmn0HhTRhj240gCxQ/Mw4bJRgp+HwPiBG
	+1
X-Gm-Gg: AR+sD12OiMHhtWVXePPsns6lD23l6Yytg7I3VDP9cT322pw7V1PBN5jJS4cFNKraa5t
	e8z7IHySerthGJb1SClDZU0uYIkoiMPnObHebXDHIPNvR/CcQ4fk/qsX1eKWDOyzE1SobWLFmjI
	YgCpcSA4Bmv4PHF4yv5/NNWlScPR7YphTQfWifx04ZOgIUoaYfbcEx+DC/jkHX6ibVust7VaUYU
	I+imRoMIcFuooT1QarzfczScNopMPm9tYdrHMdyc0QvVYGKVvDAdlpYosoiaIxyTShohaojZjlg
	NaMSRWGa/zK7FUjiJLXTLk46gCa/UomhCEYwyzzkYvl8PdzfbNPKcUeTsMc2kkF8yvlrgAwB+1L
	05DklSAOYg6maXYQ2LhN9yciX
X-Received: by 2002:a05:622a:1b88:b0:52d:f626:a46c with SMTP id d75a77b69052e-52e42414888mr35396871cf.4.1787734540866;
        Wed, 26 Aug 2026 01:55:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1b88:b0:52d:f626:a46c with SMTP id d75a77b69052e-52e42414888mr35396681cf.4.1787734540513;
        Wed, 26 Aug 2026 01:55:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deae179fsm4804376a12.26.2026.08.26.01.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 01:55:39 -0700 (PDT)
Message-ID: <5339f035-e89a-4a8d-a7c2-fc934fd41990@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:55:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Drop redundant qcom-rpmpd.h includes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r4Nm5jNnqSNKd-4xP3qh2_SZLr72t6eW
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8eaa0d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=N-HENkHhRrIbFrF0-YsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX7DuwMujcB4uo
 szvaiCFsoQfg6jU7Qkgl9kFsupJ9wD+uShyJfcnnCH7umAej1qBsPEEqndRj9GpV8JcfrlD3DwF
 B3kIVTeD76aqkk2/YmQgMprKBev6siU=
X-Proofpoint-ORIG-GUID: r4Nm5jNnqSNKd-4xP3qh2_SZLr72t6eW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfXxGKqkLpqy5rt
 ihRFzWmK93Ee9va9k9WSMGhWLWo/3l4jQ0WmDNqYBHvxPiGcfqGfXVOLQveTtM680XklLenMYj3
 IPT+MSgWD/iRcvwswSJeVg4vDuETlW7/+0pRf35W+QkBwAHgxDSJo3xIbu3RvsX5/RM4eQgLcpO
 r4eohSWxRQgiG8JZvs2bQtUIFVG33li1435zaYvTuyIc194RLADStYk8lrtq7/tWbKXHSgKncBT
 R25FXWuCokchaKqQ9dp/8VUxskTAG8E6TgM/1scHoB9dIVpKkPqL/qEKOzXF9j1B0x0IQfmGpJV
 MvG54rzFDZ5OBy9GF9ubSfTVmczCU6tXXizb6vgCThcxQjh3shPc3oLTiRkwCsYegvPEVWGJIuL
 fWQexiQB757MQMq+nxp2605L6nBp6wng/xrIkz4Rw6JLOgGQ07rUmw4hEZ1Q/XV3q3f/Eg6PVQ9
 1NyT4nlvMQTZH17ruBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260073

On 8/26/26 10:53 AM, Shawn Guo wrote:
> qcom-rpmpd.h already includes qcom,rpmhpd.h via its own #include
> directive, so any DTS file including both headers carries a redundant
> include.  All affected files only reference RPMH_* constants (defined
> in qcom,rpmhpd.h) and none use RPMPD_* constants, so drop the
> superfluous qcom-rpmpd.h includes.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
