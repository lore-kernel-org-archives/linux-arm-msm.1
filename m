Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038526;
	b=jDqBYunSmc7yomos7mFtj+ca+4SOep2QbC9+BsuMkE0wHTewR9YS1CWYBX0TFAYR6rdo
	 4h0mUBq3kVF8oLKENam3M+etpXDh0h1BkQsJ9WXfSPNE307IvZ+8EMGenVTQ3je2RPaKN
	 eE5i+RA1EI/cIlbtIhyRysB4ivpjhlWuZOuU4DeRBWtJZmqEOrAM/wUiJwj0fibq2+Mol
	 YMSUC4kATWQ+gz63gNg91mgacnKUP+gMZNMo5lYD/TvdHcoKZzMw2G2blU3cAuPQCb1dc
	 SCJQC/zgms500WrByKduG0uTgnR+ssdGPYotdns90zsjipBZQkXcnSgOqge69M3tT6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZzxC/mlDfiFU5gNlalakyp7W3bN2uLkMFf4OmwpYJoI=;
	b=UPGj/fR/ibPh0SQkrQx6/aUzMykYxX8NIWLArRqWQlFDp8NANaGMUeDHfgduXXD+u+2/
	 Mg6BWojFZLrheMX5DAtxubUObGNikUDhd1xzSJLmelbKeX4GQMLvAsYvkhmYFGJb5zIDj
	 C/hzZ6Nzvkh6myPziK034kjCz1V1sRpJc4JFfNNgDiV0i2+MuUWsY4dDXxWKwlGBx5sfx
	 5RdaPkcDV+HLILnIdeyxyyW9jrjNUO/CS8RdKqhcPbiI5maDKTHSNSI9VKPbvapD9e7/m
	 4keiTgKzOY3lnTpMIBlQQNtMRAn8bVvQY59phci9K2OUgdzVKuKfb6SQkVwfCxM9TBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A235TU8w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kkm89exA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F060A606A32E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F060A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A235TU8w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kkm89exA
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvdWR465840
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZzxC/mlDfiFU5gNlalakyp7W3bN2uLkMFf4OmwpYJoI=; b=A235TU8wtxM5RILd
	h42gaibcHoYge2tpQw2jJ/bgLJagAFeCWSRcvGwgKm1OUpFtr6BzHUpNTHS4+OpA
	I//hJvjRcAvAoE6yvOhDq7FikBAPRwy+MitJJhGIE0nk3y9vVbTOCi4U+8a+Zpvm
	Khhrj00Fy11josRZ++NOgXGeLP5armkjlHIJ0cE0IiZJx4HS8/lh8C/Et+DpZEJS
	stp8WIhiBg6jCCxNEdXfhoYyiexjHAzYxcjEhmrfENVFYmx3q/Ty3/HVgo4eeTh1
	3cykqjXB/APH6WmG4TFimNUwOGd/fP8zqWxH/FXNg2e4L3CNFPCxa04w1hIcwkA7
	RzoZUA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpus0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:15:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5757898eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793038525; x=1793643325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzxC/mlDfiFU5gNlalakyp7W3bN2uLkMFf4OmwpYJoI=;
        b=kkm89exAbYayr9ErDGXZ14B4CfLtCwfZkdtQgr5K+y1yi3EvYOawfyoi4fpH8+HPjD
         UQ9KZb2wx8Sr0EujhVaoO98b/rNoN/w+Tgr8eMCRMa8qqUF5kfdOdW9+03+kQ2SxTC/P
         m9uFmqcwwHxgHssCUcgGDOOfGgnnh4ZFp4CfSDmdBi2wokGtkRx6uFCo/cP3WdtEJEwo
         Ika6K4FfJuFa2seaBozA7iYOv9Q5O/DPM2D/6b2CjstijKG+MOToEFuvnEAtH9Aj0cIV
         KIWnxxnUdlk8BjVJj3UsxiVHnCsihCReOucaHPTtLR/LvqetobwhTNycY4dG+Y+2+OYZ
         TB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038525; x=1793643325;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzxC/mlDfiFU5gNlalakyp7W3bN2uLkMFf4OmwpYJoI=;
        b=titG6JrA+jOu3dGXOewaNUJXofaSZ7mzstLVTvRXP6QCQ/h+BjG0ZHa7PGHEGH69M0
         73C1+R4gnoqOjoVTb9WE2vciqpHT4TanUtm06gyixzL6Emmx4/TlG8WdfuAQZTx2Eujj
         sXU4RQw9OkxvkQ6wCkJ4OUoY9chpPhZmRTXhIPfrRUTS6dC6Jc9FWGc6Na2/UgTnm31d
         Dj63AuR1oFcr5E8phSRLN/aXqlf8rkTSFtGDTAUzITBbo7mia/PPZcAF1VsaO0J+HN6v
         HGF6uDNkXMspxyQSvfH0IS/hvhApQBw8bYlv6c+UIa2jZ0/g9dNE2fgRDwkxeRfPjzHT
         lClw==
X-Forwarded-Encrypted: i=1; AKwUvBzV/UGnmH8Dy4uAE0lD6qNRRspXkU1653lu5YDlKt8sfiVTI3p0vzZl1kzkGet+Pdn5aKDqW681al+iyQhN@vger.kernel.org
X-Gm-Message-State: AFq9FYKF4F9xn4mu12P2qSOIFjipNAiHPg0EtBZ80FQCtHXE0PabyHRc
	WLUkOnrvHwQQsVOQWNP7ldqdeXkeETyQczZCmJy3ZPHQXZTr8/3A/9mlRbW9ZGyeAYFLRYhIvgH
	gE1NLLLIRJGP/CkYJgoxYrlM3lAQYfMGcPa/kqGqRCGEkb4owl39G44ImMvSQiJo4PGm9
X-Gm-Gg: AYBFou39R8rXASJ3yUKmiopZ0BnB+HFjofsaagwGQwtJ9071bGyufjua0QWz/ZlbMIK
	GiA1LHtnsb6w7Gr+rES373TNoHPrXGHVuJiXcphuIC3MEFNfcz37AjqqNiNPgmlV7X89mCbBtNd
	/QC7orAA5xN2HwrvMI5DF9bFI/CqqTacDIKRy4F2HMza+2K3Xz+vjBs/5HCbyzRIoxAfMekl+gU
	/8FVxCJI0CUx8jbJ4yFg8imXqQBr+Xc9INSoemnR6bMBRh6+OVh2y530kQQYqTd038YJnKPMxwK
	UdWU28r7l/nlpyZQU2OhXMNEqLDnphOF2iG2NvB2LoIm49y3bHiwYeRQkFw2lBwjAPFuB+T0cCf
	yW9TMfQQMPHPIoIy51MCyKbA+T1ynJdrA
X-Received: by 2002:a05:7022:7f12:b0:195:1a77:85cb with SMTP id a92af1059eb24-199290fe446mr9782939c88.1.1793038524486;
        Mon, 26 Oct 2026 11:15:24 -0700 (PDT)
X-Received: by 2002:a05:7022:7f12:b0:195:1a77:85cb with SMTP id a92af1059eb24-199290fe446mr9782902c88.1.1793038523606;
        Mon, 26 Oct 2026 11:15:23 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm29204742c88.9.2026.10.26.11.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:15:23 -0700 (PDT)
Message-ID: <91fa12ce-93ec-4a39-b0e2-ed5e79e03ccc@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 23:45:17 +0530
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
Subject: Re: [PATCH] media: iris: add cyclic intra refresh on AR50LT encoder
To: Gourav Kumar <gourav.kumar@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023-iris-ar50lt-ir-cyclic-v1-1-a81d7060585d@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261023-iris-ar50lt-ir-cyclic-v1-1-a81d7060585d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA3MiBTYWx0ZWRfX4eaXZcUMRjS6
 oM7rU8+xgz8V0bqFuQWNIB9+PeqDi9IkWP9SrcN/a01uTLjM7VhCTjRo8e0I4ePlhhvnEKU9dA3
 N4VTRrE0o7FI1aQG69ROL2y5S6QPo+0=
X-Proofpoint-GUID: 2nyXdIdwXzszOOFlLSBCwxA8fg06cMyy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3MiBTYWx0ZWRfX706Mal7DKlNE
 ycjFnXjq/7web9fl1ZcjMBWzm6VH6ahflNMXc3/8RTVSZEaESoTPwN2ObeU0U5MwI8EjWpNOkCs
 J/+yTNO72zPvzT2hcLV3huYw3Q1eiDjKWwMtj1S4Bbts7bd1nnoPEa15XplFm+traje2Aj9BAu1
 gTlbEC4eaMxm6jxtIF2onBVL6zcQIAdQjKtMsTmHioZl7D5nJQ+0W+vhs0mS0NCkHUA8eYqwApP
 cRWHPJGz0iWFLw9iIeFAO2NiMRUTS5gRH57dslazreNqExhaME1ALkMSHllY9MxIIhYPj0sXHz7
 3yz93J6dVnQy9SRvostU7Nfz//wH2CxPBA1FsC764elHXve4Pngwq2pmMZIH5J12er9uQkvM8Ye
 WddCJYFGf6BNO20cwGZaN7jGfUXXbjleQaGtadMgp5oUQm2USnH9aYdHt+PTiP0tRBorP9v/Lk0
 DFsx8YsoQTns9AGMQBQ==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf98bd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=H7Zjl3+OYEgA4r5vDjEDjA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=m_4LuSJA5yVraRB4MqYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 2nyXdIdwXzszOOFlLSBCwxA8fg06cMyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260072


On 10/23/2026 8:46 AM, Gourav Kumar wrote:
> The Gen2 AR50LT encoder capability table advertises only the RANDOM
> intra refresh type, so V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE
> exposes a single menu entry and userspace cannot select CYCLIC.
> 
> Advertise CYCLIC alongside RANDOM in the AR50LT encoder capabilities so
> that userspace can choose between the two intra refresh types. RANDOM
> remains the default, so existing behaviour is unchanged.
> 
> Signed-off-by: Gourav Kumar<gourav.kumar@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

