Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869012;
	b=PHQUpC2sYz1eclSIwSSK8y7Bav/j3UiJ0FQS4Gt5aMoRUj4xVNqWemPE/XXZ7H1hcvaO
	 nqbb4VBJk2XxewPPzC8z83+e2bpaWegyk2yHGsrHfkWvQ/OwPEzvy+0+ODsj4S+xwKLAx
	 cfi5mDZzcIGmEiYyohRs8zpIZggF424g7RO8AWQ+tjiroNge9jQt27VyAhyseubOw9yjg
	 8jH4TLY6/xxt2YOg9A39J3H7PzXZiewZkI3fmc3z/c6/9Ksv40BP8PmeKSJy7ntCqxL7U
	 vtL5Pu06EG2qeQbk9izxKtr4Gkm3nposIQtN5H/dYPqd3ZVcdlcElc/PPo5dGSRqFjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GvaLovDP0kjP+a6zwEBSJE/9wwmcK54B++vPoOwCeOI=;
	b=AZGAPdsdZYeM0rZ6lYZJTAECsGS6ergs/Ngy2h5sMKVcJFumNjV3R3JwZjDCr9LXgY2f
	 60qKZ5TGpOp0SnrRRTqGr1E/wVWh4gUioYOR0u7OTEeoAN+pHxGX1kfoHYpipUb1SISoO
	 tFY3rZgt1k/+O2a8TaCV4pD6uRgeciYCQLGqZScDsd3I5TlJyfFR0NswCMP2eoepC7zOS
	 cuXqWhGwagMGmfm0GOJONTXm9XqySKk5oePIYh/enqB747YVzTQq8xvRLthN6WZSQL0Rq
	 gEvBjojXXFiftidQ7k7d7vmpRTSbBDhsKk1s2vKtsd8g/UZ7wswT8CudFH+GNklBLqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GzdTrDpf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VhgmSa70;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A97606A32E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A97606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GzdTrDpf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VhgmSa70
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U3BB565131
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GvaLovDP0kjP+a6zwEBSJE/9wwmcK54B++vPoOwCeOI=; b=GzdTrDpfC1rAeoaM
	dgE10Er9mcQEQWnKg+GI7/lhjskwclnp8YGrecIamMYosbtSsUKL5iHfeTmM0kYZ
	3Kb3ZWAgPrwa1ys62FMsjO3O5dAwlv9pYlhMbHNBvI+i8cPld1N+v0cbqCHv0fkg
	OFmzGYr7ss+RNCjHbHfiJv7L5tKFwXEBRY4FiG8L6HEe0skaEFxr7ZeqBpCXYdz3
	znhWx815s48MxamSgNx4N5vF+UHgJHWlNM2AYYKHOgGmo8V76JTEDZpaHxJSXOyj
	kfYXPnkfrpai19PtS2i47nkKNWeW9yYVjsCt/Gnr3t65fzonWgWab/5fAthdNKSt
	1gc+tQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq8w8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:56:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so48826485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869011; x=1794473811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvaLovDP0kjP+a6zwEBSJE/9wwmcK54B++vPoOwCeOI=;
        b=VhgmSa70xoMY5HPrjbSEN/gvpSwpQWce/kS8dhkYoElXa9TVnhQmfG88USDreAo2t4
         ElMZXj+O75+hUfV6Kpz8pG/G1oKbNb6tXBZcpRYkDL43yJIogqspiJLgadOTytcQ0mYO
         xt4DAqU4wYnVzMttUaVnd21a5jHrhrpt4IlT3R7EPEwW7PrGRqrHB7CRr9LLxt5+1wL1
         EilGaUJX+G+fguEcsGIvXfobbCJtM/atxx5vfgJGzG49R9C8jhtyC70zJh/y5A9n/RnX
         FGS2yF/R5rLy1FLhrQaqB5b+d3JCb8Ag6Nt2/DPHUoRaKuusKOK10hJ8QEJ17OvTJ9Ue
         gB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869011; x=1794473811;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvaLovDP0kjP+a6zwEBSJE/9wwmcK54B++vPoOwCeOI=;
        b=XZvk4r/yj1zyG0h+cHLT4SfwaiyVmaUDjRFXMtZg8iJntM+ayNl7rlR+pnrT39B2Jh
         IsNZaJ2hZTwMGVfqepAu5Xsu89c1RPcKdrQH/+1+qROXlzkHMW9fmNSeIXLdrq7c8L/O
         EwjHsJlczfmA28oJZlTXa0l2grscJGqtAZBFLFTH+VzImn77qrmTDkducGiltM6wJt8F
         ds3i4zEtpQezPO33cY6HxI3ukQPYfcRdD19pEKs0/SegB8+FimXve9/5OSNAatjNjjo2
         D1iMoV3wZwzAc6Pysdm7npX9FZ7ZXGea7SR0ENxe2Kp0od0PbiD8k4fqlBTVUhssBygA
         4WLQ==
X-Forwarded-Encrypted: i=1; AKwUvBywv5r8oVciHNJ4j8rQdrcJqi2HvtoBYvh0Q9rX6lEk2NcRTCc5/9HHdWLUG43jDx+lfxz8oiDiUzfFR3VS@vger.kernel.org
X-Gm-Message-State: APuU4Z8A+mKuIVLuw0kuyN/LkiqwBx0IpccZIQB5OOeNTYcbb8njFlRG
	nn6FH8ylW2ULUFUscOCou2P51GlYNGiKkKOsYyU6VWlITD5dPzDxWZDWpF14si7s4lsLRJq8fgM
	lZvgcmfwdxqVVAiGb9UIepSoKzh0baipt9ZElPIwwKg7XAWLH9ItSdDwi+ttdTwlz2ECS
X-Gm-Gg: AYBFou39AiRYoD5gJMvK93dUEIoumk2uVj+ue3ggAM5pXK8pcaDoJbFG+XuS6dRrT74
	gE0bwoRaS69V2T2NfhjkaurSM3MjHF+GWkqu/WJ5SVvo2EfiLp2TSgmtD6ud0qxMQlojXc5nJ8c
	ZtzEkI79IgxHOllHHLAK72IhWAfU/vs7pndCb6DrhWePBqevOKKX2b7YNZT/AoUVD9yDHWj61Zk
	DS8GxKnaIwa9i1Y4/T4RxL+DMYYPAu3C/Z+3+fhHfqylYQ5igBbLnxcDAL2VA00v3+fiwfU8Cdv
	TWT/xhCHfCuLxUI3Mx7ZtGugkes0K6du+G2QY9itaxDQKWJG56+7Y4Js1JUM9TzFzBo/0OBhbiW
	WIeg64i221KF+iF1frXSRmjJhUVRuG2qYNutZyCMjlJwTD/yb4yYFaOJ8Kk+SiQHuJ5bA
X-Received: by 2002:a05:620a:8795:b0:93c:61e0:81ff with SMTP id af79cd13be357-9442155a11fmr2712715285a.1.1793869010600;
        Thu, 05 Nov 2026 00:56:50 -0800 (PST)
X-Received: by 2002:a05:620a:8795:b0:93c:61e0:81ff with SMTP id af79cd13be357-9442155a11fmr2712712185a.1.1793869010034;
        Thu, 05 Nov 2026 00:56:50 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e140005sm158643266b.5.2026.11.05.00.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:56:49 -0800 (PST)
Message-ID: <1e26a8e3-e626-4049-a2a3-cd3abd62b4ef@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:56:44 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8350: Add camera MCLK pinctrl
 states
To: Vladimir Zapolskiy <vz@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261104230529.3040285-1-vz@kernel.org>
 <20261104230529.3040285-4-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104230529.3040285-4-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nLsrfiyfykqs4HfgEI3AlHl20BCu6Qly
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX102P5p6tYW0R
 aF5p0mt9BoF5YiqZOr7yR43e1tiFXdhnDMjpQuyH/xlhUwQA3v2VENFGa92nr7DsypH3Op/Qe3m
 9es4TkwCOgkQv8Ptl0cziRGaRXE65bM=
X-Proofpoint-ORIG-GUID: nLsrfiyfykqs4HfgEI3AlHl20BCu6Qly
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec44d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jXeCVmtNkXa6rvJdNsEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX+7QJ+AAdD/co
 UY/qj5Ys67LxbTIGuYylkGLvqnn64P3JecolNxEKHSiP3umppCBZhTw2PYHip/T10Qr6FYj6TQe
 grbGtfvqyXJzDR6KItHRUYXhI99JDWwPQ2WoPmF9fgdoKLor6/jzHTyF5fkJEeMNbnoPwxflkMX
 VyT2ypth3V7TG+xSsuG5ONtvuI9iJi9JG+J6aHZdfHG/HQ2YkURcrKcc3BMXsShiw8p+bhy2R+Y
 7xS8s2xAxyumAN9RFX1bpSr29mLQrEXygG9m57jycYGPxojYLdSxuVAuvSrHCR8vcPPxytsDfd+
 IeN04f6II/WB5cFuLlAN9BpZqlQ2eDHGH1LyDykxY3Se+dxRQ6yO5PK9uC3P3Z9lu/Nue1ZsPYr
 /79SBHlf/9x139RLjL6Z87xHD5Xumd40yHjqoMoCt0sxSJOaPCbIPWfFV7HKp5NBPNh6UjQx7pv
 36lEoVLqILyZsmMf3qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050035

On 11/5/26 12:05 AM, Vladimir Zapolskiy wrote:
> Add pinctrl states of six camera sensor MCLK output pins found on
> Qualcomm SM8350 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
