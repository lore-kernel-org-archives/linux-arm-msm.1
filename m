Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97CB4963B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101781; cv=none; b=FyHlEAmWa1i0XEeBV3aNkv1bDQGYkfyoPCH9Uux+bNqcFP98P+ni1998bGTUrBx7kIdeHz56HGF8UYxU0YnEpw8EX9R1FaeVl5fQpJVyJJwVjIih2maA/+U9UimniCQp1/szUIQyM0xtPXrBf9tDL+q7cJBAi/C0sTPSXo5LkXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101781; c=relaxed/simple;
	bh=z6vVIQROk52rZMGJLFlybPY7chX0rdujZPO2jegWweM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gj0Ikl76AHG5n9cU+qbZ5Benre+9egjA3N4AtWfmnc8QOUjbcm6LIPdmejT4/iW1+QnDrGjdg7YX2VP+ATBZpA62tSrXXM4+PUK9cxDyLrloMUIT50e02ELZ3rb80L9RX7xsifierEYm/AeymsdJ3JnjXpOawI1YpfD619qUxhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUEfJEia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJsls6Mk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUEfJEia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJsls6Mk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI73e51153712
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35SesrfLA70Pb575Lmwz3KSSxa/20NLRjs0pbwQY4r0=; b=QUEfJEia/PgOT1KH
	zQrOYm9tNKssdWuu+TKixH4cCu+12ET9VihcJGoqbTjtB8CJgK/6ILBdArG5Z/Ry
	A6KuwLfU50YKpUtmgWHn6+/xfh2ej8786g0e6k+eyhUeuF2bJANZ3kAJkkFuPNxK
	01WqcjmSwk7jHiWCPTzgBwaD2M/3s51Ifd1A4DJep2OEySOY2IxDdDMAtg7dttPK
	la3M4/RWxevrtQWiEud2pW+6Uyb01iuvhO6V69QqD1xK1rQ5xWTpt+PkV44ATIWT
	t4R6LKlwrD2aiH4E/wg02lPoMJC7IGFOOB2F+pQ/lky5EpY3EkfNtlS2p5hLvfS3
	5sVxvA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7grf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:29:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32850005b6bso106569eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790101776; x=1790706576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35SesrfLA70Pb575Lmwz3KSSxa/20NLRjs0pbwQY4r0=;
        b=OJsls6MkCdwwJx9PbZ3uFUOueCP75i7a0yeQ1f/poLGcrY/m/Op/mErWbjvH4OYAZK
         6J+bUK0NO4yf+OgpFGaRRrJ/F00PM6lXiloIQdesfS3Qws2xunmvW6dMKZObDa+ctC8b
         LQDGQpQWp85YLp7R0Hy3uLwvNyEWnHsvV0hcqKebY6/R0INN4X/aWiRdL9QLQP0fVoKP
         DcZdz786VVt19oN/z2f20KJ430WJo++1LcY9j5MJF2EtQDZJFolWFBW8VLwNeE5sLD0z
         qDnuYz2ZN66TxjLBcNdnaHmQ9iohlN4kWbfT/AVyGinXgZmFqcSwL2OG/aT2qvdEnjnp
         0UYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101776; x=1790706576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35SesrfLA70Pb575Lmwz3KSSxa/20NLRjs0pbwQY4r0=;
        b=uP0+ru9Gr5eUc6qoY6L3g4VwWauvwcni0fVMyQZgwt8ZC7e1eXmYaMEG1AsOvuNHyB
         /RdtQLzyUPnd85QWzoeldvyDTESiGabB9ycWZ1P2EtmsHVQ8JIlBLabGkX+d3FGQG+qo
         3HCZFWFIGb42LPOqsV96KaU6/LMFdi2fCgKILu/231Gx4esJ5phjHmUKjxsTk3/x873b
         5vb10qao57qvpxMnk7KChqyvLOVxtZWkm7Igqna46l+0mI63CZIH+7l6VT+GVRpTfMg8
         mlSSVz7G66l3AqiKUnNVg7qonHoQwwW/kvhKQ4pLL0A4OslUlmZP7aUeo+kCvC57luN1
         t4Ig==
X-Gm-Message-State: AFuF++lIiLY+VhKV/Ci8ojFFQSOpLpjX/tRpuziMc2DylJizB2RAFQtz
	aRa8cqSaERY6SsDic2w0GEpqQ+OrKimds6ADA/32GI4egMOb3iRScle3+EpRl9zcHtLJU8KleBr
	6qc1ipkfvtknD2DCgygBBzivyaAC2o8eE1k2GlqlbzxeFyEyh07eeGO8Uc9aC9ToryVxs
X-Gm-Gg: AYBFou1KzNZpp5xw2P8ewq9xuQ0KgmXihOv73JkfJDrbum0A+X6gW4HQLHTvE+eX1ZM
	fBocOMXfj0w2ppJqzjislkXx0hzTVig2NTkWAb8FbWyQp47zX1UJVRJdYgGMxqQqnQneN7FBXQu
	3XzN7013pGmtxZNSlmSdXrDDoNGRmZk1h/cH4hpboe1HkXXWB46w/JwN05nMCJ+r+9/SGVr2fiM
	scd39FCLjHWmBDli5HI6oI3mm5dk4Z84ZeOBAl8T49f+ttH1I7LX5lsHI5bSXXIdSRT7q+jbb0g
	3qVXPn0vaMw5grni8aMBIuBt8H4NpqdkQijM7u0I4/GCy753yJve8fnc6VyxI+V8E+gb6r/PiVh
	UGUEvXeKKlCHfgCnyrfJ4wNICGGfiKI/+Vg==
X-Received: by 2002:a05:693c:41db:10b0:33e:6b65:5eb6 with SMTP id 5a478bee46e88-33e8dec45f6mr125674eec.30.1790101776342;
        Tue, 22 Sep 2026 11:29:36 -0700 (PDT)
X-Received: by 2002:a05:693c:41db:10b0:33e:6b65:5eb6 with SMTP id 5a478bee46e88-33e8dec45f6mr125637eec.30.1790101775697;
        Tue, 22 Sep 2026 11:29:35 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625921asm109954eec.15.2026.09.22.11.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:29:35 -0700 (PDT)
Message-ID: <be1ca5fa-e537-4b77-974b-d0a0ab0965f1@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:59:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: eliza: Add iris video codec node
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
 <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3MSBTYWx0ZWRfX3XejkcflyODE
 EogjcjPkZ7KpY54aTKukw1etDmxUuBBiNdCo1QXfWQ0L9sWH0v17zFggafbaXRHlUuC/mges+GK
 s13zRAMy7CdT7+1KjW/l7uKqPE2cbw8=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab2c911 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Db7omukDTCqXEX29fTMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 5Qj1Xg9udMpwRdjahofmUJD2z6mEwQGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3MSBTYWx0ZWRfX8iD0cZhZnmvN
 WolMJEbjwtsuN9RfIpmV3W/2IBzxlSosr9ICoA6AtvUZ/YWE1TLq60kQydpIvzKrSsfxvRtTbxD
 skeFC/R3Cc/hXiezu+rGhhYAuGHfQ7RhdIqAQd+iFUhS+3Z8E5vIKjY9dRGv+1W3ph49g1S5A0g
 +WQQ3E39HH53MlJIh3TbccXLT6QF3BQv8bIvanslC9SFefBtAWXaQTWzANbEsgBxg4IUxZRo4Hw
 wJwBXUN4SqrfXpy5YmYgbLpxAMMowf3Gh5/AtzKzHDFEPEcNHTB5Nt2OE48G8HziEbYCxraNAeE
 h/V0bv34bUQ4310Px6fQ8cHNc5Px2nHkQJ2G8uZ/DtjOoNRA0skXaOwybOmXlxLWRT7QLi/CdBh
 fYrR62vfac3IBwzW6xqBst+4xm2vfY9dmRMEK60eGeolj+Bqz517GlrGeW35BGDQzr3IJqqBzsj
 6zj0Fa1LR80yTUlkxxQ==
X-Proofpoint-GUID: 5Qj1Xg9udMpwRdjahofmUJD2z6mEwQGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220271


On 9/21/2026 3:21 PM, Wangao Wang wrote:
> Describe the Iris video codec hardware found in the Eliza SoC. The iris
> node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
> GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
> codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
> support.
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/eliza.dtsi | 98 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 98 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
