Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4CA47D472
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814816; cv=none; b=ADiGLT8IPjCPkOJwMiOVwPiskse1ddTQx6vzcJLDVuSDrQvP5TtLjyz6fhjoT/qlI4vEgECzMVmGj0pkgh3vdL6W5aV84pBErqkwkuvJx3Q/U68fyXTxP2Pv/m+D3zsdS0iJFYiIqjbE5Ss2/UMrgjVuYGVkl7muMWpuQst0YBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814816; c=relaxed/simple;
	bh=vGRDJl7kyRoobjtQdlgk+yLGBbR5Hgt/PTr9zi/5TuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n77ld4ELlVghWLIiNv2951loCi+P+2XnACcKzSZBbJYuiCGzWtle5nqhhTNKX4GeUOQC2tnlWOL9S8xhml+OxX/3uG7fjOIqUMIqMy5lej5r024JhV2Q++20KPfe4iOt7UZlPG7dCRqPbO75l9y1sNA3eDMYQznv2iwzdZO/wE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxeHOCiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLrpWO8m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxeHOCiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLrpWO8m"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0AgU2275884
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylCK8hYC7LZLZaR0wLbmkM5b7kq2nz3B1dnKXYSCvp0=; b=LxeHOCiV+2KSo/Qa
	/QrIJiuAwRpQMW6LoLY1q6sLOwspiD3PuSd9WKVXm69JWIcOm1iQimp1bYIPWQLo
	3dj5kTWLttUk/LmXtLlKr+BgUSpjcg84eTOmIl3Npo2NmXfynxL5XZlGz3Cg4L0M
	Mp95zBa8GlM3mtRkm7td6QS7rjOVYE0nn8l6TclKM2k3PPKxyMCuFr/Vn1SjiHOt
	VX4DmODDXgYTuxmLcWwhPEl9/RPX52xRmOeYt6dPAvqvRm/dtEupswae8L2QIl1S
	+XfokUHKj5KUkXndkd52T3+FTDv+N/6e11itNGba9v+TkZtgSjvf/o9mPfbmw9Jb
	hkzhXQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq1rgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:20:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91782d0a163so4847636d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814814; x=1792419614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ylCK8hYC7LZLZaR0wLbmkM5b7kq2nz3B1dnKXYSCvp0=;
        b=XLrpWO8ml5PNxDG6GH1ikBe3bVXw/4hycA5aGJXgMHv2xtBYFT3sfjrFmbkN2HnwR3
         /Ir9BVlINteYzObM4UPQvT7H/0X5Rb/KdLWF7/NDFxKAe8gidr6+nIQfMCUanDPDtpYN
         0Kk+IxpTKMlLc8Xil3FH8SqLYG39CNMUN/0k37x4xCSx+NmBdmylpt4xr23EwkTrsYFg
         pca7dOmAvs6tfapsUGcySUNLh5KIn0XdQXABqeCBtFE8BNs11odQTVMiY2IHPBtIQwVU
         2LGwJVrritRNHbcndBl3vWmQCL0wseg0HFIt/Ss5qckXXGTo09Mj+KLYUKuV/OfFGNja
         CciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814814; x=1792419614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylCK8hYC7LZLZaR0wLbmkM5b7kq2nz3B1dnKXYSCvp0=;
        b=ufM3bsFPencTfnoJiyhOhiu7AOVSF1r/pcduk6u5sICOeGeBNJLf08cafrrSCSf61X
         FxGPNXn9SHeT2FmA2IBE4Dl595c7In40oFYZFRjXRujDQII7+gOCdVaOQ6D5i10CH+Vl
         wqWVyirhVu3/53zYRNP9iuAmkYuC1EV9FBj+UEatpmLqzYuFmfISNIBxodUCItr9rkH6
         pZEfCpGn7EoPqWRAxr8BWbyfI3A0cAvC1CqhyHNm/MtJ3RGtR5pUsiZ+rPaZqX+0ecg5
         dJf1O3BE6Bwy8JNDlqqBm4nEBQija1RDMKX3wGThr0lt5QOAcEZe0vfdjcHHXWKIFgZ2
         9Gew==
X-Gm-Message-State: AFq9FYLmvUeNeCsFFawUXdwGsBre4XaXW89lnV19ZCftRpF/Y87rTlnG
	axpPgm1asZWVuVx/hdxsigRxHeU3fIZd4Mx6wqxOE7jIvxoMQXTzTjg9SlrCns7dwJg0TOKm/wT
	3aWLder8N2jmApCg59/+KgZL8ytv54GLMig14HAiukak+rSbPuUDalkdR5qAaEgX0J1n7
X-Gm-Gg: AYBFou3YLyIVXd1elaIkbA8aF0wQaXv2NbRjtbzuTAbf1u/qtLDIDlsTolaT8kjBYhe
	TbqGxE6Abh+RUNP7ZWwDd6Vv1ZO5t/H7Z/M808+sAa9xyIjVPNGxmcg/V15I0XFo5p7ve+FctPZ
	hX/wvzvQiVKzdhZlYE0pGHZcNeuGIP9pFq5nIs0VWqTCQSSLJr+LJ8Z2n2g0N/U3W6RC535TVXQ
	KVMMycuApiKEoaYF6GQk57tS2+j3wDaqJo0Mdfr5IYEFc3FMPuhSohmij4CPu1+5XqmGjRrhtou
	iS3uey1smzafGDw5pGIReLuO4OADKepqyRlQkbXLlunewOB+qAt9h9LPj9Fp0SFmZw1ThE/yJf7
	NhCa+7jtV0L+zGD/3vH9XWg==
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr1904420885a.3.1791814814063;
        Mon, 12 Oct 2026 07:20:14 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr1904413485a.3.1791814813429;
        Mon, 12 Oct 2026 07:20:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1aaec1b9dsm2257054a12.0.2026.10.12.07.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 07:20:12 -0700 (PDT)
Message-ID: <351225fe-4698-416a-be97-df68b9297224@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:20:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: q6v5-mss: Fix memory banks count for
 SDM660
To: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261011-sdm660-mss-banks-count-v1-1-f4eced49b509@minlexx.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-sdm660-mss-banks-count-v1-1-f4eced49b509@minlexx.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accec9f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=ZEkBDfZtAAAA:8 a=EUspDBNiAAAA:8 a=BNY3paFinK7L0Tc9HpMA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=fsdK_YakeE02zTmptMdW:22
 a=IqjDwHP2KxQYjTbYCZGP:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NyBTYWx0ZWRfXx9WTW/dHVJWn
 vH+J+Tm9MU1EPX9BNrl4IUn4B/ozVtEQolRqaw3NRnfhxYqTAekg8kZdpW6SmFE3xLiUTSC0SJj
 8Vde7VvXDwX3amYDJgLRPunjTdY/+mc=
X-Proofpoint-GUID: gvsvYxzA8L74aJkYayhZFDVakiIvKpr7
X-Proofpoint-ORIG-GUID: gvsvYxzA8L74aJkYayhZFDVakiIvKpr7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NyBTYWx0ZWRfX/Rmw1G0H2zbX
 PBP0/R09sA5M0ihcQLuQGZEz4YIpQHl4lD6Q+JNUtiNRfwF2lziaFQdz8VakACdi66hqDUoZi5u
 OOT/NeM68eZyWwTMcznYn/vc0cO7gNbufXQ7/gmJMoqJStm1FG9S9+yc154bugVjIWzWXkBlsv8
 6LolTYnnRCKwJdzIeu3SflJGNZG2zLT8PdoTJr/QVMVTvgIUoo7jQu4VdaANpDH2OjF4oHQ6ZOy
 rvB95LMpXQDbf6eNITi+PanhsHqbjxTBUEIpScDTkGOEqjXCaVJPegxZ6nCSeMzgb3r5NTeo+dp
 b0DW/CS71zRf6n9tLW65exifjhd++xVAmS3rAMfXRRiL7SJ3GvKBV/GEY9EGhaeIP4+S/0u17N3
 +oQN9WTzZQs8HgzagdblMm1t4nF+ZHE7F35/8agD024wjHqEqE3ki2IBqovABQacFoe0+LQLNZH
 1YzHXScozZC1ZaSPSgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120057

On 10/11/26 2:56 PM, Alexey Minnekhanov wrote:
> As per downstream driver [1], SDM660's MSS version QDSP6v62 1.5 has 29
> banks, not 28. Leaving something unpowered sounds bad and can potentially
> cause unexpected crashes. This was missed during addition of the initial
> support for SDM660 modem remoteproc, fix it.
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/
>     LA.UM.7.2.c25-11600-sdm660.0/drivers/soc/qcom/pil-q6v5.c#L508

The linebreak here makes the link unclickable

> 
> Fixes: 10b6fec2c8c99 ("remoteproc: qcom: q6v5-mss: Add support for SDM630/636/660")
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
