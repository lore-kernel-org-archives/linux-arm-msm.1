Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386155;
	b=D+dzCtiUIUvyYea+oiMz+4vEHhBjYtjEXC9ucyiPZ4ZqtLb9eDdHiY6Jc3GHGos+5nNh
	 kNJ3f7r4gS9LHrqCc9m/g1w32CChxiShh9dNuvRyqLEgybzhwl84FDBTJjrpJ4A/KY31Y
	 2AoED0MJBVTbX61GMu+yvs8TWp/fecB1UerCXZaTR6mUnNo01U0HgrcRqZJusXjRYgcVF
	 L2cvOb4X4afZZfmyNzLs1uAqkczC0jWBa8qw5TBEvh2uM0gzmVu7E0nZgTNs3fJrZgjGe
	 uwnKHzMYfwszDL30X0jxAffjwnpbxTNb01xT8TvZTNXoQT56uHA4ubjcb2higgKeq2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fQqe2AyHT0YtNm9ybUXW8UaggXCo/B0M8+3MYB5QA40=;
	b=wdbpKAPArPOfatG7WJy46wLZn5UzRpxjSXuDFgEdEfziSLiPlZpSCjiS7367SU2SwA6q
	 ZY/xjaIvz8Omm3T0aNRKIXhp/epj3+YAPVxagsGLwqo6lLRmnyUSudMXnrsuLUQzF3XoV
	 i7o4N03h75yxz3t/vtq/USqGqDkYuJw1CFJE5w52FRlsGsA3V+PiQkhhmWBiSnFeWefkC
	 ccpZTKytjgQNalbLmVI3TFHBwKZoU056eCznyE/6Zip+XpVrn2omAMvDUB4ia0hPFTO4O
	 tTM16FFjpkCuJt+4b+W72s0RZsrIBkeWiIC4Q8vRYshpgJ9OQIrr75TFpRZhoDhdwcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yptddehu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeHNMP91;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B70E606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B70E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yptddehu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeHNMP91
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KSbJ2021321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fQqe2AyHT0YtNm9ybUXW8UaggXCo/B0M8+3MYB5QA40=; b=Yptddehu+01hnYqt
	+7LCcjvPhkQb4W7x2CNWLKvcWykCpCP8/a7RKhS7aaCTE6xUA/WON5THudMuuZHg
	rtZ4uJvXK/d37KEcK83bvyPbwSgUIUUFwyZUxRT8m15LhUrEUsOMuRCdl0CSPPML
	VWxej5404/r2tbH8hLw0Oj08yFSU/RcZ5T5HmRjmWQzW908IocRrCj2qP9/F7IkK
	CZRWN7czKmL1lH5S6d8f6F+mY3rXzjX5ITO0onSFKt/1Cpoaw2dnIOgruRw6V0tN
	fa6QNBgDj8WVfXX5PLgcBiGATsdm6ZOHxRFq+UFR/fAR0LYgJsOlMgrrHoNX7Ein
	+5tMkQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pvc0vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:35:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5033529eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386153; x=1794990953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQqe2AyHT0YtNm9ybUXW8UaggXCo/B0M8+3MYB5QA40=;
        b=NeHNMP91UZxngsSaU1f2nN/RajwhvMOo05q4IXRIBn7uzIbWpcPW9VNaLdijUVAIw7
         Fmj0abDtAnQZtLjtSoQvCp68MYn/TqcoWlV/FF3ojKmFjIwWdu7wEmxjv9qhCy0TOPAT
         YtIsnHY0hqNR0JO7XyUeKf+GbnwOYn4aOUedWso73z/t7RwBtXYmPht9CgvFxRJgVO2L
         sPOao33nblneWtAJ6WX2zU6GbM1RAilyuJZpdf8oK1B77f9FoAKl8hGzQKguB/3ahE1P
         4pvaOLZQz8kyVBCQWUuEKWtFWOtllih+fTj+/aI4ctHUIxYb6Av/FET3Zn5us/PdjV36
         QQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386153; x=1794990953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQqe2AyHT0YtNm9ybUXW8UaggXCo/B0M8+3MYB5QA40=;
        b=2TzVXAFgjcpNLA5/KKj0vY0Y/4H8fe2pwcdN7OJUduCjOAxB+TBaT5PPspj2tNb2tc
         bc9qOtoNesnNHBcOcm5VTlwayu3k1a+wf4OzjEgLo5u2NKl98ovZSY0++L3J5Q+ER7vQ
         q+CqtW0fybGVphutEieXRz367BpECSVxkT5jqLgb6RQzOJJwjIlRzkHHgbGbbSuIY6Ow
         d1BUnshWQvPN80xO1pR7XC///Z0gRvp9RqjpPpfhsLWorP59U1qDlmYbCtdvSCuupq/7
         gw6N8Q5TitdB6I+5asMUtC0rGqdCs4E9OfCBG11pfK3OVUvptNQl/xlRmDVBmHCMQZlC
         +aBw==
X-Forwarded-Encrypted: i=1; AL+hErHtTHpHQXDxQ711K1QADm3etIVSpPwlaYAvV30qkupR/z9FM5sYgYhFKrjcQjUlBB7tqZ28jFwTHB6Sb+s5@vger.kernel.org
X-Gm-Message-State: APuU4Z/DXqA2dX3ImCk00RMISzva5gNBvNafzfazE9OQ1tg54W4qvciV
	LMwyPKBrqq8xNu5POPwGA/FsPmNYmfDtKZpIaiAFRNnXjSiScL6NV332M5sINTETcRDFEWjbK3R
	sISqgA1AWgv6ykCVcERaFz58j58w332CnVKWG7CGnbfkKvaqkhrAYj7kMj51pVn0fRBrT
X-Gm-Gg: AYBFou1IlkEZ960qn4H5Y5AlxUV+Pjzu0JWJNUcqJiYsMzqKU/Lq27/yqbwEr5P9dEo
	xmjy/nOkLL377VEKSHrW4yEhL3KLkWXhtuw3dOJfMQKYe3FRL0ta4POYUz9km58ViG/+zID/gBa
	BCKE6e81B97OON2Ck8tjCCJFhT8pnsMKOK2NJ8owA4e8x2kQ/+JqSiOK+5+j5ptIHypLSgTsoI8
	QFpzs8ppx4RJR2xLxWz4wnp65riYXH9QoPEBd3AewOcmVRHTm4TbME8gb/uIvzHVjNiXuLor29D
	ZXO121rgNnhS0f6W2NKhWoWcL2P0tKkWOHSH5egPhSfA+QEYvw5oAzxldX4YM4+S8bsGS5Zf+if
	qVDTgFy3A9KOrkJgI1VeZoWcUduYfIX+L0pyfnSTotw38P/yHBvsKeIcn1nzZSVfQeyFOqYe3xa
	mtSwM=
X-Received: by 2002:a05:7300:7f27:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37685c7a324mr2436976eec.23.1794386152999;
        Wed, 11 Nov 2026 00:35:52 -0800 (PST)
X-Received: by 2002:a05:7300:7f27:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37685c7a324mr2436935eec.23.1794386152463;
        Wed, 11 Nov 2026 00:35:52 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm25690687eec.18.2026.11.11.00.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:35:51 -0800 (PST)
Message-ID: <baf7c1fc-5eb6-4b39-a396-3df0d367e3fc@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:05:41 +0530
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
Subject: Re: [PATCH v4 04/25] accel/qda: Assign a context bank to each session
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-4-88f2f24a5f0b@qti.qualcomm.com>
 <e155f52a-cb04-4334-bc7c-54385973c87d@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <e155f52a-cb04-4334-bc7c-54385973c87d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af428ea cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=AF3zZIX-EdkCpG9-7AIA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: fKRRQmjPaLWdz8MYwU5kgVYuUjHxsCR-
X-Proofpoint-GUID: fKRRQmjPaLWdz8MYwU5kgVYuUjHxsCR-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX+xYwUm7HU0BY
 avnijcCNXmrVI8mlu8a+WgaTXm38tSaYWSJlszFW634wNEz8TX0bLFMUv+Ig0EuTnuyhUXLdrYh
 McNSpExYTQg4/iVBGZHPGB4Z5R1ImSs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfXxO8jvS92Xuwf
 Qnl/k2U/BTZKZl1K5RFP9UXRJ/HSZaifF04uoAP/3lyQ5IsDkIYEibmYmrbSmGmjubdU33O3Yiu
 rdNeP4Rf+XqqNz0YmXIkXR0+5+Rp7/vAexcHswiAGAsvL0m++rs0M+P7Dko91AAzyLCI7ka/oJ3
 p9MFhsTuT8bi1Ou4keBVUi6+588QK7X47rtQPP4dnROKLtwGMraZRH6MEGqABtyL8VlQaGk6v7N
 q5+99ZcHNzlwcofnJAqOS2jwKurl4mb8Zgj9IVzdh888uobgEVXgd3b4JD8KUCFJANTKlFT6uDn
 2FbOvUXdTb46eLSI4zPDjKGzAUhtXmTjiaBHoUha6NMo2Z+9+IT7AgzETbqFBREebD+X+KnFbf3
 lMe0aN6RSXRyTQwRmRvyM5k0GeUgoEMT8YvhkiMg/tK9KGooAUECOfww2VS0gOVcg6/vNk3u0GP
 cFuc73JlJx5cbxBPYeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110034

On 02-11-2026 14:15, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>> +
>> +static int qda_count_cb_nodes(struct device_node *parent_node)
>> +{
>> +	int count = 0;
>> +
>> +	for_each_available_child_of_node_scoped(parent_node, child)
> 
> I don't see a need for scoped loop.
will switch to for_each_available_child_of_node()

> 
>> +		if (of_device_is_compatible(child, "qcom,fastrpc-compute-cb"))
>> +			count++;
>> +
>> +	return count;
>>  }
> 
> 
> 
> Best regards,
> Krzysztof

