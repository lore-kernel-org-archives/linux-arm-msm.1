Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB51E49CF59
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819103; cv=none; b=QdmJsTd809nY0ooPpnZqFDifEEvtOkdro/f2UhRvG1emgQJtcvy4Fem1Jhkyuwb8+vWJ6Xwb8Z7yuPJju6GYKwWQkg9wPc9yBQljApFvZxaxOhw/vhMNwdoeGUYC1l4iA4Rvxg1nLopPkzRDW9zZ/E4pgLMibsmGxZuDYwumJ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819103; c=relaxed/simple;
	bh=NII8/DvpqZvskuTyC2R0uY1SUxGgGLheGvOiAEFExD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXvLr/qv6fxD31W0wgh4bozvU1YFYldQevm324tSSGjGwkq2Z4YZcRzomBk6KnPo7oqWqMQRaqBC/L0svXl0i4utPa0oGexKtqbI/CN4Wt42smqYqNHCgJOE9k7mZ3E6oL6Ba9x3yVP01row0qeUIIMY+MGIKmaolFitfB5ZG3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YgChnls1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlzzrtFT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YgChnls1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlzzrtFT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC05OP2786873
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=; b=YgChnls1v6APMnOz
	CfpwMi4/W8O1NyM5mDb1nmrHRVOlUyMwOzIQlHp2tAPYtoB0UX6CQ1cMLengXVH9
	LKIl97FTOhfscwGK8nbUFFjmW9mF+VDQkNCFt4yyQraKGLQzDsY1x43RYdii5bD5
	qphBZlnwu71kgwqyxesItpIiXtrJ3JgWEJOjf6FldAG1/HFOFK8AK22/8HKrxONk
	Lz8njybC6RbpmVeC9+keKvZEVvSO255QC40crcNY6thDluRJGOC1CAI/83XWY2Rv
	Tg0FzkwBAduCguvqOEqNfrhbLoP3CGJ57N1W1FFryVil4KQJZC1lQeaCAs8QHHWj
	tHk3MA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffhd7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:31:40 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c101b7f863so47792137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819100; x=1792423900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=;
        b=AlzzrtFTgoHk7dR8z4KGCP7nOZYLpWKB6BEgU+9A5YjxBHuCvYZOCOq6I5CjTAUXBl
         LwqBiOB80JAs5y+1aJVbAGDtJpdv+PnyP7mhsUpPUdBdL+nAq+tZ9bu16kXapOT7gWfp
         uZy7mMDqISxS4QgA+mNlw8bAXe+U5AUqMamuSFZR3pIq3lHJG1WjSTRUvdZhlDDoITht
         RpqjqeWCzKUDK1GBEReZia5mHDTa5kJTjE2/oLhPFkO5hzFxZ9BwaQc1FXkiYw4BRh4I
         OenrT2g36NgjvjiMwgpY4waOshzXeMY6hWzHpaQkfuhZcWAOXKXwxQH5NQMe/MmMUSPv
         bjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819100; x=1792423900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=;
        b=fSLBOYRengFO0DERowCoFhqLdBlTfmQn/ZBo9Wf2cfsH2NA/fA4EZtMaMVxv/XBY3v
         IUiZeHI2VC8MpWgbeRfVNxBToTQyP5LAr7OY6YgD7fxJpnlEg8M/Oq083IESYcRoM7zy
         DrKLZAWQ5303HvBX28jhTYppMHQ8feW0kY7zlVBG7HcXo2k5CmJmHdHP0CYp/klel8dT
         +tcSWpQK4k4Yvb+WTkY7s2TzzG/eU1cUyxfDotako58JOnwnq9UIS4RxeJ/yiYKqwDCe
         6hPzh9gqs6CGO8ex6tueqtlEw1claSNW7+9kLm7rEjKaJOZV0zugqLbrEmvkMDLspxnn
         aVoQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4SkTl9LU5rpq02c2TMSmq22EsDFBRusJhr3xs0ShRtyONa89/hClEnxY4oUGuPXBqp5pusWMfCgoY7BlZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKfqDgr04XBcUYzLLkbDB9c9Oj6GUMNsTOtcwibBEIE6R15Nwb9
	C8KmMg7RWOaE+gidQuNimkrRccUZPQGB+eDMmkH+Uq3rNeoAu30zww3YgluHsIrAw4nXgqpJDqy
	qbrRywdsG8FzPx0eS3OZlc7JqAUZf/jVU6aHZcxTgExDhEDzngvKmy5fFi0PbEDV0/hJr
X-Gm-Gg: AYBFou23lsQOdhLk00ZNoc1cXECF/eHtQOON9Ig2ksACy02M9thJV4GdSliIP9jRQYA
	qQ4t4VwB6OmWxu21bGtqkpU1MI9SBXM+m5HhUiOGU43zvjetpIWgRF41tIIQJKro7tQe5iR8rFS
	wMBM8+x5AX0wEUwjOfUc0isxmCOQQaXHPTa/r0fjG4tGkNv1qLvRu+SsO1k42oo2JODFz89l+z/
	E9sLih0FlJYW10xw+OVp8UU8FOJBbmYnz2IQL351XJPlqa0zACYXikfA7ATyqkViQ6npieXX8qN
	ZYtSWkFIv96WF2qF8AOjW+shWMtjfE8W2xm4kEWElQ8DXgqZ5NuzhAnbLgrcfiB2gUVNsMAEO71
	+HeFsM2yi3ll3LiRXK2u1Dg==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1470228e0c.3.1791819100184;
        Mon, 12 Oct 2026 08:31:40 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1470181e0c.3.1791819099635;
        Mon, 12 Oct 2026 08:31:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34001fbda1sm203669366b.66.2026.10.12.08.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:31:35 -0700 (PDT)
Message-ID: <0ad55730-8ce2-4cff-a84f-689ec5716d7b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/38] arm: dts: qcom: msm8660: Remove empty line at end
 of node
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <737de4712f52d1ba198f9201cd2581ccac7b938b.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <737de4712f52d1ba198f9201cd2581ccac7b938b.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXwLeAF0u2Qtmv
 p1VP+7pvJa1Oy4fPxcgdWmyuavUg6IM2uC2NbIqcVWDrhb7hB3DypYvaWRg78XD+rG3KvYFAkvb
 sjq1nF5e57wStTlwS2xlDPiwkQVx2VvrvJjHSFESdScot6zJzF7iO7u9z9oRwmIJVXT5M1XPZig
 MlCbShnpDmwbDxcJXdMCunLW9usSjtbLX57Pdg/Ux9afT+hZNbhs4e2R2O7dp/LAjsTPV4c8P/T
 QoTWPW9uvlTFj/38AilCb8WEUyN4NFdDbsWlYjaYny9mTPlMV/FYpN+IaDuG6bEabfEQp6c8Znu
 2V7JmwSqhe04GfDR1PSAN9rcJ53e6ZcIkk82rhuhRP5Yc10JOQ0vonbXwnaF6mGtt02uobLye0G
 BBSqx1WgHb0WF6dVIh6o3TGPavOPJDofM5W8UKIHvWu+Geiv4gbhD9dnb4MFFCeWfwVG/5xkqj6
 +58bEUfJS/iiJFynikg==
X-Proofpoint-GUID: P0Yc2cqTf5hXiAIma5omXrhDapRdxehJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXx5ABIY2C3Wuo
 1yShmo2kHC1Nw2zzAtz9RxQ8xpMTC/wAh1V0dsj7ljcGT/Glj05acQchsmpLKFDxQv4dSTpq0DQ
 AFza/CT1WSx0cpMUQpFRb4opIHcdMQg=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accfd5c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=cfbp-VlG0RD5cB8OVJAA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=crWF4MFLhNY0qMRaF8an:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: P0Yc2cqTf5hXiAIma5omXrhDapRdxehJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be an empty line at end of node definition. Found/fixed
> with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
