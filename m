Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108096;
	b=NquzJskZxbtP9813Z4LacIRTG0aODTr9olE2PC1Vay5qqq3sm9FCeGsBnr1/J4q+e6Sg
	 jCZUFQ61U30H7YRax53O3XYXxS47Ei+MBoBad7cTF2uu1WnYuXiWR/6vlmlSJFgaV/OyX
	 aIgAQEOwBsL05X9ORZfzJMOArskvVa62RNNQWttJH/3yfsRE//8oovM+FBidXNAqI6UKU
	 e0QV87duQrF8X0sZXY0AdAR21VFAbvKFCMSWnR7qcc5eUd7hReq0qYwtNlIfjhcqgENfM
	 HmbQX2FQ9wFpmghqsKNS/PaYhw7iDe7vKMPYh6dhnM+jgeaqKIl/SamV/ub7c/dWgww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=humybFG+4U6oD9aPKeirurXab/GZiJOO+gMWAoyWycQ=;
	b=mybQT7xRXM5mamDgjR83ACgX5F7QKy1cqQf99UXg6wBMOjPNVvJWM0E0U5cI18EwyAD2
	 aSidWLDcOgSAbWJ82j/JlTymX7TQaLutlqJpQnBPPfikkIf5Hlj7eVR+1M56f278Zt0cP
	 2loFAq11Vn4Gm7v/awt61p7pKtEswkmuHRWweJsqSXTcojGcYcrZ7rDcP81GO3tN63q9R
	 ldfWK+KhBVqZ3ed8JVMj0L/GPO2jTddIbQ1YgkkBWy3/mwQfVN0J0qfzMGf68mPDErG03
	 miXALRClA2Wf8qG2CzUtqXM0rENzBtwWtAZ+oewncCArJ7wXvu8o3cY5cHR1IPeQlSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZc1ObIq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKgtLxn0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656D1606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 656D1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZc1ObIq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKgtLxn0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeKMm1427433
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	humybFG+4U6oD9aPKeirurXab/GZiJOO+gMWAoyWycQ=; b=VZc1ObIq3VYML8eh
	tRUqcPH7SLsFquAM1/bjN6JN0kOjqUOrYN1f7uZJfTkqBvUrK5bDlwBaLh6xKsvI
	wpwpF2me1hy9+cKf4i8IWqp8GQFKUNRz9HrEzOG1Atw4xQjon9+RWgsqHzfvmCAK
	1C1ZPuc3XNVCOMPr18aOeVQaPElik7kOQCnq3Seaqyx5hlRF5TEsMtI+xD6HQWaM
	7rCxBIg9Z4KDz701Wg+H8j/nlWMGp3P9rkEUPQnhCki2Qt+LvNQFi2ct0WBvt3xn
	QYB6tQJ9yWGltPT27H3/z44lskLhwuH2e6U4gEAcph3HI6N8L+XGPCG9Ik+R4jce
	sEFXwQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbuba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:34:55 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-151dcfb1569so653853c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108095; x=1793712895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=humybFG+4U6oD9aPKeirurXab/GZiJOO+gMWAoyWycQ=;
        b=kKgtLxn0gyFEUGNKsxvLyDDqTSPC5z7sFnBKKR9r6iMMsJVz8ZvVaXr85XUZdmmsM7
         kB9P8yV3q7jINgcjjz0d6SyW7Q/UNlR9vlNMoPYWWEq/jD8+4wgHeGd1JSPkeGc9pO6C
         6wVCvhqjeARyCD5ZIaqWkU8nB+n4s8ScuR8OwnbnBA3iiyZx0yXJdGwPKxKv+w62Lwq0
         LzJwD6AAe+Wx45ZeUfeZSE4W6y5xQ2mXcJGflzIL04CwEYpe0olMqvmlMtVf/bvjIZh4
         eo+lc47Ql6QDtx2YIhhh2qYTm6+o8KH+E0U38r/dP6B+FDDfFvj4siinR6JTiacybEh6
         /9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108095; x=1793712895;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=humybFG+4U6oD9aPKeirurXab/GZiJOO+gMWAoyWycQ=;
        b=NvGEvRtIRJkDtCYEcWG9bJI6hzvO/Cx3KGmMq8ZVIULbvZ23yBMj+fNuUqxMrBp9xD
         3KrfOZrGyQQJTJR5EfvgqfhA4t5h1/Fjyxd5q5oy85C22fIlg78ZHbygTnRKzI7ha/Lv
         +xyMxFDFVTZirBg6JhxjF0NzVgljnD7jSxUf1FRYDbKmi4Xo69iz+q8Y16VfaPFqGIUP
         77PixI+l6IDmI1av4Dj2Ee9GxGBdBG3YLZqmeAJFDGVh7vg4fKjqP3CLfygNXcXMLNvP
         7JWhzHIcNcQHZccfpeJFa10Pk3sFe4JNzmPMPhN6xdtnpUwfEK33IYGc4CWBCec3IPDG
         nCkg==
X-Forwarded-Encrypted: i=1; AKwUvBxj1SPJzIRBjU/ldWeYlhz4ZGAZos13rV7CYl9VFjlbDYkjdDLpxYE0rwkOY/0hWUBd+e9b9DL755mqFwbC@vger.kernel.org
X-Gm-Message-State: AFq9FYLwcgWcZsarPoQSUZ425HAEW4q+890XdibnlaG+SdhyX19cYfdd
	xvmmfvcPBG0vrlMJmskDWDbfUUzI+gmeQocLSDO73W73N1tOyn4/mz4OuKz7MM2ywodlOKAi7rG
	932tapv1AJTsAM8lhGVXmcNJ74Bgdr6OiSB8K8hNIk75+iAsx9C0mPQHuynb1bHEU+Xf0
X-Gm-Gg: AYBFou1XdAAdFzEvZ1FuXZC4JnZGRq2UE6ZNj0GCQuaH7SyKURkrSpi6rO03CFCaMYw
	7WRlHHzeQNnMVu6ouS2DqXll1ZVgCLGZmEoGYi/jOlRUzRRKH0k1j3oztO8bnxuCSBWJ8C95g5J
	z/0vQxKS+L7PXV8NeM/tMlS5GiTdUHJkfLv6NEhS2YgTImS1d9CBLJl2srVyfiI2lBCt97i8kbQ
	sUC54v21bSI9pNLlStiWiee9JaTP330qSON5aMMWXpE0ASpk6hLrM659weLdpHAqgii9ndszQvv
	CJiNLttKcVNqdOxi1et08RwuoF1CVlIIFSY5LvZfEgO933gYewgD52o+WvjupWpH6r8HFUTNCjd
	fTzDr1GzNayiBjWxBx9ZrR/F5mBjRRKKdqZO+7yylplD7F/xkOZGO4JD3z9Zb+l4eLYpPkxtTl6
	0XufzEIyA=
X-Received: by 2002:a05:7022:f8c:b0:1a3:cbd7:1269 with SMTP id a92af1059eb24-1a3cbd717e6mr5335399c88.23.1793108094577;
        Tue, 27 Oct 2026 06:34:54 -0700 (PDT)
X-Received: by 2002:a05:7022:f8c:b0:1a3:cbd7:1269 with SMTP id a92af1059eb24-1a3cbd717e6mr5335328c88.23.1793108093680;
        Tue, 27 Oct 2026 06:34:53 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a020df20sm39957140c88.6.2026.10.27.06.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:34:51 -0700 (PDT)
Message-ID: <197ed473-d259-4f1f-ace0-ce98ac0fd127@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:04:47 +0530
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
Subject: Re: [PATCH v3 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-1-7f2a6e572de9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-1-7f2a6e572de9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX7LifmOBxDD1D
 09Z3Cezks1ZRQK011wxJLbWeSWqlPhqtBciDKwFzduyVyaBw9q+m7eeBqmhknk99MFvY4O7LURX
 T+oHWKCjp/Y+mFs+eZA1IHahcuSHLec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX0rKXO1oK0kz3
 t43J+RsPFBmP9flIpAWU+EuRIj0B0wV6oXMw5s6+5G669gJYUT4aXXvjeniWwueQFE7W5VCi7eU
 jLAmYRSS8qG65RcMPAUwhYiJj3joCiqBn4I6U90CviZ3tF3C09w1dHzIovafVOJaIxElDUxnQDF
 SMzrZpAsFuW+rCscgmnl66DVm1qpI7rNQWMEhWjCfzGy2I9vebSQbrTncoJgw+sbkVmBwqSx8Oq
 R39DpVIO9/uAc6e5ycPq8nI4+mitpXDF54ulzq3hxUSyS7P+huXJk62rc6ZOp/dtd0htAF/kN/W
 KS52W83AGcGwcY+qtaGFq8EVuKcN1aifrRQNhY7UCCGOJC5Wys3agrr8hQHjG7zoVwJ3wnQT050
 uQVF6n5vSDhA7fg0n8BCU1QiiW/Zjn1D3Hd7wgUAOulurEs9Drcrcn1mOsnC/kb4dDC2M2830xA
 jcTDcG0esHbOq8AncCg==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0a87f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=lV1k8KV2Q4sVphKZFiYA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: bP2-eska13uvV1wsi1YkPAF55MCVVyhh
X-Proofpoint-GUID: bP2-eska13uvV1wsi1YkPAF55MCVVyhh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270054



On 10/27/2026 10:43 AM, Aniket Randive wrote:
[...]
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index c41bfac65ddf..394e7287f6e9 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c

[...]

> @@ -1692,6 +1709,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>   	}
>   
> +log_tre:
>   	for (i = 0; i < tre_idx; i++)
>   		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
>   			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
> @@ -1825,6 +1843,18 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>   		nr_tre = 2;
>   	if (direction == DMA_DEV_TO_MEM) /* rx */
>   		nr_tre = 1;
> +	/*
> +	 * Recovery opcodes do not require DMA data TREs, only CONFIG
> +	 * (for set_config) and GO TREs. Since gpi_prep_slave_sg() is
> +	 * shared with SPI, verify the channel is I2C before accessing
> +	 * the configuration data.
I think i have mentioned earlier also. gpi_prep_slave_sg() Not only 
shared with spi but rather say, is a common function for all protocols.> 
+	 */
> +	if (gchan->protocol == QCOM_GPI_I2C) {
> +		struct gpi_i2c_config *i2c = gchan->config;
> +
> +		if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS)
> +			nr_tre = set_config ? 2 : 1;
> +	}
>   
>   	/* calculate # of elements required & available */
>   	nr = gpi_ring_num_elements_avail(ch_ring);
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
[...]
