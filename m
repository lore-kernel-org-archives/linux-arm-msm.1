Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778246;
	b=N6kR7lgZC1ccAVZU1SmRFlePlm6F9Colln4jlI3sf3zoe8f2nZchEnT4xDdLddak3Zkv
	 bYJCuxOeIEettTSlymnJR6J7WOQfAixnsxlLRNhfEh+RZfWcHGMECkTCXkUUbs/ajqS9d
	 SpsA6+NjTgSrNSIO4NIujPssPuW+v3DF8i3H8F/fo9MBeC5S7hyOw0JeWkUW1a8JSsS7u
	 xuQ1EriOXi/5U8GAolkzBM9whTJVIsiwA0Nd3ish885HyEJelEIkW8tErkNADJWqkn+//
	 Xg7drVWzVS4OmEl/Hs3GzWpcTOu7ylCNLWTDPksb4vWeXongIuPTT2WLGDd9GdesQHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J7aET/IE+2hW6emFP8wLbbJY1PHnS1Od0budwcNlMXg=;
	b=D82ALmpmrwKaDp3qmwvd9vBuvCqkO7NN+KZEzXM/Hx0+ScG6d76aos1inaKcK59ARC4f
	 GPCbkYkXZNrHAdor2FMVxwbnrB/oHkp11FB5AY3zmip3vfa27j3j9kVMt50JT1qtX9Km8
	 Vros9kjNXr2Ec7LI8f558D8fLgS/yK3gw1kWSwJVS0WhfPFWN5z3z8Vg6Zf5qXGR7cZww
	 KcidCUsVzsSiF9J8lxVdi/dLxCl0H9laSvSwQYbhvySf9/cKARP25Y4fwzQ1zpOW1eAJ9
	 oKqaE8P8v4fpf8ywIt5UitxJMN5e59H8dkH6i1kffb+zGJXq3O1KQavIbG6B6k3choQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q8WXuqQi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOi7nnMV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CE5606A334
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36CE5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q8WXuqQi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOi7nnMV
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp1D41047034
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J7aET/IE+2hW6emFP8wLbbJY1PHnS1Od0budwcNlMXg=; b=Q8WXuqQinCBwbiJn
	4oRswH2mSYR0tnsYMicZFgbpNJmyCzC9UonrGq9n92rlESDShcFvdSUoqKKig4y+
	PUct07VsBNXwNZiaYgydtLr+/NU6P/6lcg9Tjy5iju+w17rGhL4ktPrYYaWekp+9
	YJ108jywd0GpQR1yzdTDR5m/AGkpGB+9xi9WAxKqSvIGzgLl7xWu2STWlKBfA/ZC
	AQp7eNGB+YO2rWe1jH0z0D7LX0aDDr/7ebh95cuPpRH5N1cFSC5V+WnxKjluEBXC
	39T6dz441YC+IC33RHH64FyE+7GbmaVYIz8/tqsOuRU6uY5gLszrjNxYmPq5z74a
	BruI8Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqkpdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:17:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f08491d837so38314735ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795778245; x=1796383045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7aET/IE+2hW6emFP8wLbbJY1PHnS1Od0budwcNlMXg=;
        b=XOi7nnMVutF0Y7QfWmOL2L0+xNK/UkjG1RjYSJ7k9h2pNW7xK2MyO32/YZ7emLhOlx
         jOFEhMHEI5+F1Z7WuUAgNpD0snCe3tqNh7JljCSfIYgkfb1MRDtvdIRcHTZ64JRjhYTX
         iPtKQJfXA9LNILofmRsu5jEw+eWLYjZVMY9/Oq8Kq3DtKsDeT8Y5BPYwRZWoHJBmdTuF
         kEWDCQp5DwhJFQWYSWE9s9q0pcfrkTpIu7hoewtXaIcLRBU0cyEgemYwMTymIwpRtZM+
         QWLuCtibYRuJa/gPI+Ah8B5PGuAtG2NKUPKRs9cEXKtVsOA6lJwUaB7orF/BdC7CUwij
         BU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778245; x=1796383045;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7aET/IE+2hW6emFP8wLbbJY1PHnS1Od0budwcNlMXg=;
        b=UoQQT25OMBrl8CzaY97SZaXrIEmMaJ41kjbbMNZB0s8j1SRyXzllxwtfstqy8kfVwe
         SFjJAVTyfSesBCvlFm63oawbmw3PUW9NkQOeMn5tnxOpxKX4KTWNLiX0+w6b5OqieP8n
         ZsslvuaIGKGwps6N2jwNVRNcldjr+zwEeDbL2kObRhXywbTwqRRzwPU4g9hbr6J+kED/
         kHLa8n064ZIq5A52s53OKM714npLNnkgHmsfNKypndo7CLWKXzw0yBfnjM10bgLhsy8t
         sIkR0ooct5iGncxVv444X+82ODk8DYmfGMt0JfbBAzdnnw3urlk8XWE7GspqGBfUXm4p
         WJoQ==
X-Forwarded-Encrypted: i=1; AL+hErHrk531Y5ExOaTvyRuD+r2hLg00fPRjGTUbKbFSKyfGLRhNnMOwfq7HrRLjct2dasfaxjy4q8ZXH4/xYHX8@vger.kernel.org
X-Gm-Message-State: APuU4Z96cd4gFu0fX8GevavhqQ1xzf9loVoc/6zGZNOkJvgrXbkVHiBz
	v9HFfuFACK6ESnYWjAa9GjTj8z6FhGzM708WaqeDJInkmRjIaIn3qKC6/tSq5NP1hO/uPkQ8lJW
	Cl/fi2M4XRfVEuD0KM8orchijQLREThPmarZFfZrVFIJ1n5crxTIE9NlGcU/XcNLCxNxf5ZIlP1
	KW
X-Gm-Gg: AZFdTZfM1thZbeWjQ5U/H3xUbTNJ/xd0tbWdKuA3s10mmcE+h3TGgoHKRv6DWNKPBhU
	TC8May5FLvwk/lVc9DEcpNxYD+sQfhV7rye8RJIEEdYunZTleHsxWYhQ27T67cwc8z09Ys28yrw
	WAwFtd50wFh2wMI+FQwnQdwkngBlCYWWzqCS+Vt3kPq/XXuFYog588oluYvKLc2SHlOWEDjsspV
	M7mUmPJxczspT4Ft2F/xz+RPXbOLLUj6N/+8nkcDyv7WMvT0IJjpfhP5kYAjtk66rQGaZ6fDUfb
	ts/iruFf4M6bGTgwkCxZW0/x9QzCQOY7Ht5iwN0phiwIXcikuSFUH8ksgvjUzDKpDrgMpUCucxF
	USzja56rZH6Ic8qP1UTu9r45PHbfwsd9nxgCjp2CTnucg8fqVGiG95uwvysYNSj+t4KJUs2Ktgv
	eX
X-Received: by 2002:a17:902:e542:b0:2ed:12af:13ab with SMTP id d9443c01a7336-2f03f2570admr213221855ad.60.1795778244461;
        Fri, 27 Nov 2026 03:17:24 -0800 (PST)
X-Received: by 2002:a17:902:e542:b0:2ed:12af:13ab with SMTP id d9443c01a7336-2f03f2570admr213221575ad.60.1795778243931;
        Fri, 27 Nov 2026 03:17:23 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0ea6a8sm116521515ad.36.2026.11.27.03.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:17:23 -0800 (PST)
Message-ID: <34619214-35bc-4ac3-8eb4-92b9d3e1bc1e@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 16:47:18 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] media: qcom: camss: csid: Stop using csid->id as
 both index and identifier
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
References: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
 <20261127-camss-routing-fixes-v2-2-b7152f0af49a@kernel.org>
Content-Language: en-US
In-Reply-To: <20261127-camss-routing-fixes-v2-2-b7152f0af49a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LZXMA7SnA42obhbL3uDjHoLJd88HklhA
X-Proofpoint-ORIG-GUID: LZXMA7SnA42obhbL3uDjHoLJd88HklhA
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b0966c5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=cXrFbpxloNIy6EuSPpUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NCBTYWx0ZWRfXw2/pmESR6aJv
 t07csLeqBvYF27Dycxo2XYVc9uTF4AueoDIAngRRyROodTa8N/k97Xspm8Qb/eH7oYzti9cKmHm
 JJQCw/TjtvHMpcu+SLhe7Q6WHXk478A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NCBTYWx0ZWRfXz6LHHo63ZS0o
 PuP/Am+Mcch3SiTHmLpn+7ijRJsyVHL1QDk7ANJT6oF3P2wVdoyWz9+bdPxA4L3Hs7Ya48xZw+T
 0KEt7rSRjSFSTDFUfQDSM7h3alrrVqCXVGavP8F8uuMVQCFQIfMWEiOLCvftbQVRk6aZ5vFGyQQ
 JWRTkhAQfGgAn3+odiNMnzGFfKz+M2+hkQgY9WhdHUkiGPBzILJcca5ZbLh7FYRVecHQT0UNjG6
 /mmOtyc/8otId8+BMZPHxP83IMurGwFe8XmdhoRXOzolL5YA+jhMRQic1jkkpWK7g+PCzXDhK/I
 cz6f4YG0gVpY4mi3D2EMJQtUDGZfUJ+qJdhdmN5iCZcJWYP8D4nyeHJYETSQib08nd45Ez/eqIm
 020jMmzmdOq31PAMevakyNHJuXCWgyZJV5DDFO7LSacfmlbBoBQPh/uk6hJSWv9UuRO3UOU/h2N
 J18wqFtW+7XoGlC270A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270044


On 27-11-2026 09:45, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> We have thus far used csid->id as both a hardware identifier and as an
> index to the array of CSI devices.
> 
> This is obviously not correct, but has thus far not been obviously
> damaging. Removing a piece of dark silicon CSID2 on x1e80100 we see that
> the reliance of csid->id as both hardware id and index is a brittle
> happenstance.
> 
> A previous patch enumerated a .id field in the CSID resources structure.
> The purpose of the id field is to denote hardware identifier.
> 
> Instead of maintaining both an hw_id and index field in the CSI
> data-structure pass the struct resource field to csid->id.
> 
> Use helper functions from a previous commit to differentiate between CSID
> hardware-id and CSID index where appropriate.
> 
> A level of granularity doing csid_index() and csid_hwid() in separate
> patches wouldn't work as we need to change the subdev_init() index and the
> meaning of that index atomically.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Monaco EVK

> ---
>  .../media/platform/qcom/camss/camss-csid-1080.c    |  2 +-
>  drivers/media/platform/qcom/camss/camss-csid-340.c |  6 ++--
>  drivers/media/platform/qcom/camss/camss-csid-680.c |  4 +--
>  .../media/platform/qcom/camss/camss-csid-gen3.c    |  4 +--
>  drivers/media/platform/qcom/camss/camss-csid.c     | 34 +++++++++++++++-------
>  drivers/media/platform/qcom/camss/camss-csid.h     | 17 +++++++++++
>  drivers/media/platform/qcom/camss/camss-csiphy.c   |  2 +-
>  drivers/media/platform/qcom/camss/camss.c          |  3 +-
>  8 files changed, 51 insertions(+), 21 deletions(-)
> 
...

-- 
Regards,
Nihal Kumar Gupta

