Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03474ED1BB
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890525; cv=none; b=U/bPcmVw0aF6I2J4FX52ISyANUPaErzy+6ThGVQ9+TsZ+KfDWbTC1cr7YVzDm0IoJLrCltPEWu9GOV+04ikmNlK1qBAfaIog4Nemq4JWIIB8VqplBtsVaYMX3HOKsoSt7GkIbMlLv0FgueS+KAGs7lGdoDXv0FKEbxGiDtaWKoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890525; c=relaxed/simple;
	bh=Ca7l2SoQ59LsCYSjUOtHSvzwcobgCe6/+3uN6E1Y4kQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWStiWsOuwGjH0o0sQPaUM4473EtxcvWid1QgIenuy7XE+LvpboSktjg2dg/A2plnd9r7mupx8OUMjzMeT7U0/LNecA2JKkP8eBB9zCfUsOP1GSPBx34XZI/2V7hvs7lL8ZNaYi9eYayopmFceFtYl5RAR+YnJtga6GceDoHOyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKftdZKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dp5eVPAL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKftdZKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dp5eVPAL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6ZUWb3210078
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7c1avwBI6cCr1P3gl9NUcM/qSQ9a1RvEzOrH3fu0TE=; b=aKftdZKo/F2L0EGM
	9MuWtaw7fLgd+2/RpTXU4GjRogB6eNKlOz9q5loS5TVXU1o4eZxpvsSs+fImrcwB
	VZr2nXJ6e8W/fDLMa4PtssqSqCkrDsfNpuKxLu3yOZ90RmwqPEKu6VhQtZNTKdsb
	F6daRsKrKiuJvYN1uFD8YXiHb5sF6UeWAf2BYKIg2izpAPyrEpoI/lvPQOHpOIu3
	ySCcj4rzmFvDdrwI8+TMYsISuniZolhQQNZ9KFsdC2MsYA4dZZYrA6UQduBlCH6N
	o1XXa2vR1cwn/aUgvSUbfRFzpfMS9lrU+UFEE/dBlF3HlmRmBfKP6+a7R0bs2TpH
	IAF9OA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjh65e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:22:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so26416285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791890522; x=1792495322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x7c1avwBI6cCr1P3gl9NUcM/qSQ9a1RvEzOrH3fu0TE=;
        b=Dp5eVPALEeZpgiRcTB9tvMzgXeLahNdcx5UrGnsflatgr84XSfygD04e7QY6RAxmpg
         Q5+Bx+zwps/ayMq8V8dZ6c/xq3isVV4Rg657Y0zcfl6YgOlrsXz2tvi5Y/m9l0VoCMrN
         YuxzsFUAmzEDzdenftGhKUm4ePFE1N/8O+w3TmHnsVnsyhf4zqkltZZNyLnBYFzyPGGv
         ZPPjafZC55/XpYmYyAAX8Nldy9ztBD8nv1zehZdV0jUJPqgA7+Gi9o1U1PjgaxTBptYO
         xbN8Hh/bCQQ8T2LWSquQqJxAtnqpJVGkG5Gg8+9sIPV9QvSdL6Zzc+ebh0H7lCFMMpo0
         N1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890522; x=1792495322;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7c1avwBI6cCr1P3gl9NUcM/qSQ9a1RvEzOrH3fu0TE=;
        b=LAAAgMtIaRyUjRLEka7PvhHsDKpnl29XyHsdKwd8Vy8oY8kRDbVUcJPJE3dT6YO7QI
         SHeNruDRAkNSuboJ1kfycGVmkijjjwc4FJM6sk1QTBoeAUmNTV/H0i4YjgQCZE6a/Syg
         BIe0lXm2mgRH/NHmZNvPR4IsyvvGSb4+KgD9eYXSKkebuiom5vWWflXPcUHCpJKZBvY/
         rWcj56EmCsihM2k7ty8qrk8vPNC1EqiTnHY6h/nAWSzZgdEq2h0LeJJLpz+QtCSAWcsK
         jwEEMwKkFdiprzy+HLZlxehYmHR/OLtep9wXvt5vSzOsGqqn+x12nQD37LoJBrfkKHzK
         qEUw==
X-Gm-Message-State: AFq9FYLFqSIYXLuWargaVls2YJyQDmoSuN+Mz8bJ+YERC4euifX0Y/Lq
	vipfMxSVFpFkbj5xIfOCaiG99RmNPrOTHfiLaCYMPmLkXE35xg2pR/lG5GsJpzRRMdU6st7pxfz
	aIh/9KyGnB4eBXX0T9jki/Xin5SFOcA63JuFCn6NgvUm1fvDWEDXfTkKm/9wAeh3BeZqw
X-Gm-Gg: AYBFou0LhrZHjb8RGsKP0rISB6DxQzZ2Mk3y/AgIriMq1XN/o8qmUXgyGQDNwpd0Svz
	iihl0ByGQE4aQpi27fHaWrl2w+I1nxicJYhqU2o9YzS+PnodXs3DV1JkgVsljy/I2Oj9m9EQ8ev
	CLbcdo3U6ar/fN7hZxbIPuPid/5PrtmargucReDIWOFQuFX+w2Y3/HemyTbEgjlevdxt3/UZWfK
	YCAgz/HLuBd6kC6vg+wd6Cw1jqiNQTtnRkqvDEqvKHGzp+9hHy6HLrvdGrUqK0gUIFMNxq0qSio
	MUnXFSlm+x19l5U1nnYZxrFrNa9s8LvlpzcbE74RJzcYhJdwKDNSs73lj1+iQwvAX4s7ctNzrH0
	m6t1p4xDPSkMb7EE4n41gMg==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1076529985a.2.1791890521919;
        Tue, 13 Oct 2026 04:22:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1076491285a.2.1791890516636;
        Tue, 13 Oct 2026 04:21:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dc0c2bsm6114822a12.11.2026.10.13.04.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:21:55 -0700 (PDT)
Message-ID: <32681ae8-3356-4570-8631-650fcd88c803@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:21:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: qcom_battmgr: report full batteries
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008-battmgr-full-v1-1-4f5485a9c421@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008-battmgr-full-v1-1-4f5485a9c421@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3XtgxrMXo6n2F9pq_xaVikRFnWh6YtHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfXzP9+3weqyK5f
 zRjUI7Pcs2OyY8VFKryBrZ6GOT1dlOi1wVWr8A6ns0xeGLCvwGil3EyoJoH9WRXf2nXj5KzyNNq
 61I8qTkHLGjZ7T1WqkJ7mp9KZdmJau/q8MXlX8PGfVEcSLL3nibMbw63SiUpqcjisQ/zK2ZXMw6
 OxxJzMcumdLCWaM5s5lE/m63mYdPnArdOwGmwA+NZkxKR6Jo+os1RjMkr+JVhbx8uTyG07QCALw
 ByvLWCyiOe8VKhzQkakoCm7rXm7qynE2w+HxklhL1n3go+jKNgG5stGzfO+Ir4wsQ+xjD1JLSQf
 3KczctUlkf8HzvGoZtiG7OReKEjwPJpLgX7gqwC1g4G5i1Z1qWaGPY1OcDIyXndgidJoOzdr8+8
 83A4EIb5GpPDZeP/al63cylXi8Q+98SJ/R9VBpF6AKbvoaodO/HlupFEn3vGhR8ItSiQ6RLay3Y
 RNSZgyDVpvQmk4C1ZEA==
X-Proofpoint-ORIG-GUID: 3XtgxrMXo6n2F9pq_xaVikRFnWh6YtHa
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace145a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=adyeotTpviE2zRAQUGEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX7EFPdvjlFmHk
 TOk14YUVjGEPwfNVtYcSEo7W64djx9DcbLRX5NzB46kn6p0iRJY7F2K1vca8Prkqhd44LsyX9cQ
 KbxTCGUH6FXOl72RQjqta5REACwtXmw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130045

On 10/8/26 11:14 AM, Bjorn Andersson wrote:
> The SC8280XP battery-status response has no explicit full state. When a
> battery reaches its full capacity on external power, neither the charging
> nor discharging bit is set. The driver consequently reports "Not
> charging", which can make userspace show the system as battery powered.
> 
> Use the response's power-online bit and the reported capacity to identify
> a battery that is full while externally powered. Preserve "Not charging"
> for a battery whose charging is inhibited below its full capacity.

Let's define that bit, as it's not obvious what it corresponds to.

> 
> Fixes: 29e8142b5623 ("power: supply: Introduce Qualcomm PMIC GLINK power supply")
> Assisted-by: LLM
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/power/supply/qcom_battmgr.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index 7716eb9e1aff..97cbe966ea84 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -1261,6 +1261,7 @@ static void qcom_battmgr_sc8280xp_callback(struct qcom_battmgr *battmgr,
>  	unsigned int opcode = le32_to_cpu(resp->hdr.opcode);
>  	unsigned int source;
>  	unsigned int state;
> +	unsigned int power_state;

Reverse-Christmas-tree, please

Claude also has concerns regarding how this interacts with charge
limit (although perhaps "not charging" should be good there?)

with that resolved:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
