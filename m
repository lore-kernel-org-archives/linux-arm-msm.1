Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717690;
	b=UIUJQmxvSi4UNMC9YY5wXohwdefCUzOrDlTXt8qYgtREMlpl068pVqrgHRS66i3V47iA
	 FGvxRke2dPPqorHheRvei16eSSST5BAHo0RVlSNuEFNnKGFRkijpMjKMqA2fI4z5B1dTh
	 SfSwtmDGHwuE5sWqpB3vIld1oas2SxuEXQycQ64w/i+zxPK69xSUsuykhhFd7y9rqxNWt
	 akp/kmDbI96covpr9Gzg5MkmLHGkYz1bCfQWwAzv8toORpgmPF7YrBJIxSqKMWkJUUQOv
	 lWXIPfVng2Rf98/Ia7hRU4+6APYBlpWHbFsEpFXNcQDrBuHW2/nSEZ4YJDaj9rD/4Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XwK7pIFH2QUcKHLvESz9ooBqZDoO68FmReNGUgwY1OU=;
	b=v3wnyrjo79AB6PTrXb5KHtm2v1pujW2vQQTdnVvBl1Hm6PrtDnifBrTvjKFpZp2Nujx1
	 69OpJSSJ8RjA+AITU0bu3SndowfJ7Kiwd51c5h6BuGwYKrZZKFZPMwXIcoWIw+BF8IrM4
	 HFcv2Egtnq/jIJwyiqGydekr1NW8LTTb83+hTSU9N2fSJESGZlLszpYAOgn/OHkrN6Mr+
	 04iQ0pggsF5CXPbgq0SSY62Kt9Gan4lcidCrhLUYd8kSl5nMZt1LKyb0emfJJFTPAvfJn
	 FjUNSDdkEy55kTBsZjVbBcgJMioC/c951f+nyxYQzGA+SMXhIR/3QTVWrwvZW6QWgNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FYstDD7F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y2rJTuhh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB80F606A332
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 14:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB80F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FYstDD7F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y2rJTuhh
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EAHUW3690011
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 14:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwK7pIFH2QUcKHLvESz9ooBqZDoO68FmReNGUgwY1OU=; b=FYstDD7Fm+ZmzrwA
	Pu9d48BKgdzgeQAnuyKjmn2S7WTwGtgCj6D7Gam+7IB3rC8SHUttz9ymcaNsND+E
	m6FoGS8slbo5RUiPvdLF6pdgI7YxeUONRxzvnre+eiVq9+/dhKxpyC4O7cHB4SN0
	e8aH3uIJW+g7AXM+63TkJnKeYalm/Jub+LD1rPbagvmPiHDGtxtB4PqSQeSo4CUF
	74qWk3Uco0nh+E96o7aAteljnRmxCFhFMrlLwEIPAdP8cefmC7S77GP9STWUTYwH
	tV7Kjd0U57xVYxZ7gUDOuBho2rTSMpmojx4YbkQld7qfW+9j2UJ8kJXYdcV2LonX
	VSySxA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9asun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 14:54:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7c7e8becso119300686d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 06:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793717688; x=1794322488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwK7pIFH2QUcKHLvESz9ooBqZDoO68FmReNGUgwY1OU=;
        b=Y2rJTuhhHdP6B/kNIbOSrtQYY3fNKgWop2McoL0NeWRg8ZtboyPK4SbLey4cdOjfen
         P7pauTi9YCE5ijP5qdUstDrjW7Muw2RXHFoq3UkU2gE9RmKuoEceVg6vNw9LFqw5PMPl
         oee+cvm/AjBTZBKkH02BqTyaBuDTT5yu3JVuGAH5hu5K0PNIMXOTc7YVqtgyVqI6T1OY
         TPFpXs9T2YaAJKbU49alF7TiQaDIAWnK+zxSox/ODxBMWQ6u4scOUaHyFunGA6/FJzTM
         BFfAhIYwM39l0jDTTazH1yTomPvsxmW1ToX1jTcGrMY7V6JmUasS7+GmO2dlxp2AVzWG
         CUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717688; x=1794322488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwK7pIFH2QUcKHLvESz9ooBqZDoO68FmReNGUgwY1OU=;
        b=GEMVta+pCkDADKgX4HqbbeNIlHdlGFUkdIHhaFi5PUaI2k4DiHR6Uf2I1Kx9uCZ28n
         nW5pCJS8pMD8EIiUijRyVCF3qnYbGA6BWgXyKLbxIum+B9B4uffleYl/omB3qpHPtqEp
         ZwgnL58Hm7aWQF+IHKrZ9rKO1kQhAFh63x4scf7AcRRktq9AQArerf5BjF2XQXbaj3nr
         Gc5OVLkZQX/TXjS2cynZ/3Ps+0YSfhFQ1PFq0gA4uy5yt1ZOUdpN32FerX2pWfS3si9k
         KY9/KxNi7MdALDFwx9fB9lHvh6OyGCMOjl04gTxXBi7NPDIswytx83eRiGdGSI9fDc5S
         EyGA==
X-Forwarded-Encrypted: i=1; AKwUvBygecDut7EvY9JCFHq18VHzCcgyc7Mxi/yqPLa7KSnxx4Aw8vWZqvIEEnJHOV9oFdMd6PVEg+j14qRq+OJX@vger.kernel.org
X-Gm-Message-State: APuU4Z9EqMAa0vWhwiMtEyyAm8Qis27IVjVXqC8kPJdLB4egUMUplHoM
	qK+/mssfTd4/V7nJ7GKEoxHliP2gdXwlYGQaD/5f8uYvHVVyyeYn9mXpfzZnqY42KyaPLa4JvgD
	p9iztACXi8fvXzW4Vu9BzSkmbOaECmAwyeLQzupRk3wfi/TRF2uJsf9ETuwMsvvTiy9JowZqH5m
	AS
X-Gm-Gg: AYBFou1urhMPOvX7czlZrTMcEYS4xR1yA3AwXKatZopRaOdMVBeIKUdxcLRFWVcgUaz
	CPr4u9GwzZWaCLix9mP0JaQhNZg8aPNLG0x1JgKSgyPsmLfhbThpZbha/ZGKOoAHAWJtsdzbr1O
	4oxWEQUFtmj1/g4dAyI2VNILOeJ1lVD4yoTZ4mvVs9A2R386RDK41dFbcEzIDmPVR5yPO9y6vwL
	GOd1NRDMgntdMpxXj+lgmcS53yIPFoj/X1O9gioeY9zZ0YxSqDhWl6f49yKCHaeCNIipPY74rI4
	TPomE28UHoZ6t3vUi3n8UIGNeVBraYBfdm/b7I9yMTODcJPurA/oKKur8dtdojj6uSy6vVM4Gmg
	DB82s4lKvY991WLDKgt1ck1KRHCfqWOEldYXAHsJ/1JtdabsDTrHafALVP2XWDqce/Ox64hGlPx
	bioWvAoma+l5X+
X-Received: by 2002:a05:620a:84c4:b0:93e:66e6:fa4 with SMTP id af79cd13be357-94421712a8dmr2083493485a.16.1793717687677;
        Tue, 03 Nov 2026 06:54:47 -0800 (PST)
X-Received: by 2002:a05:620a:84c4:b0:93e:66e6:fa4 with SMTP id af79cd13be357-94421712a8dmr2083490385a.16.1793717687198;
        Tue, 03 Nov 2026 06:54:47 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aae24b32sm60341055e9.12.2026.11.03.06.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:54:46 -0800 (PST)
Message-ID: <5df59181-cb60-4e07-bb4a-6f3ae994798a@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:54:44 +0200
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
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence
 tracking
To: Bryan O'Donoghue <bod@kernel.org>, bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
 <MPrRsE5vvB26tbMAT443IrH7Zr_tyIPaFwvQfnZj5TJUaM5uN8MyHB6kU6Y7rW92Sy35A5GfNcv95YOt-4YUNw==@protonmail.internalid>
 <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
 <7f3e822e-3749-41c5-8390-e6d74b203927@kernel.org>
 <36008be9-2b25-4f04-995e-f90e2547f7f2@oss.qualcomm.com>
 <JG_h5JjMWB6vy7eR2AS1dqGGrNxZZgcte904oblinYLOAtSNIAdesLgsGrFpYyxekmZ1_FdEON9Uoua7GmkX-g==@protonmail.internalid>
 <d3a7c0c2-f5dc-47da-8466-d0b77aae9b9b@oss.qualcomm.com>
 <57a326a1-81f8-437e-bd4f-25f79e0cd1cf@kernel.org>
 <RTmFZ9s8mJZID5gOqlgbB25-7YXOW69IODnJ0a0or3wLgu64MW13ZzPvahHElFCxst_XHlTf_TwVJOotEJRzwQ==@protonmail.internalid>
 <d4d0161f-37d1-4b93-8b54-202e691d66b7@oss.qualcomm.com>
 <2cfa4a92-2be2-4f13-84bf-ecac133b525f@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <2cfa4a92-2be2-4f13-84bf-ecac133b525f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mRcSp5QDD_AJ3WvLctKLLliZPJg6e4D1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX110FQL6cLgDg
 UsYf2/OIjQ4lpNxGxi8zAVO5M5AUXe8o7dtfXeZaKLsRZ40mr2lpbYrFqLdF92ZL5pNBKCXXb5k
 cbfJMsq9l1KC7aSWDPo59korDX4KJGY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX7RkKqJXAQyCR
 gyqlR0SC1/HltN2cmwN+BRt4G5bkLFy+ewUymmXVwPEyYNHRGCMBsog9T9OTwR5T2XWLeh5b04c
 De4tc4xaS5OVzy8tzoMSxUcz0h9vD0gLrnIeegAb5DwGXGDX8rUO1LwCYOI5BNC9uoqGMGsm3sG
 knD6kHlxpf9ozscgLEGqC6pfLQl1qov3ReMiarKtLrdrDllaoBWWBKx6hflGn7h5FQ6t+d48D00
 x+72vwpssXKiB27j0y2t1apOpyxc0vXINF0uj/FFS+RHpFcvb0Fh306wLrs0bDlpdcz10TKGiQx
 n357Z6+Zsj3gtnHiaWF+5PeiNBwhVBxY5ci+yTXPH8sSla+ivjS3PArmW0HzT1jzjbyBHw2IDfk
 Dc3Clg/PrHaYb82wQn1uyS6+XY5IrhIcMBaLU2y2w5L+u560ous++b8Q+Q3BGwGSttj3RSd4u5g
 IKiEFszAv5+D2l4VhxA==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9f5b8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=TiwfKaYzfpL80q5XJR0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: mRcSp5QDD_AJ3WvLctKLLliZPJg6e4D1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030059



On 11/3/2026 4:39 PM, Bryan O'Donoghue wrote:
> On 03/11/2026 14:35, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Bryan,
>>
>> On 11/3/2026 3:27 PM, Bryan O'Donoghue wrote:
>>> On 03/11/2026 13:13, Gjorgji Rosikopulos (Consultant) wrote:
>>>>>> More than that though, there is in-fact a VFE specific SOF/EOF and EPOCH
>>>>>> event but these require the CSID feeding a frame into the VFE pipeline
>>>>>> and the VFE moving through its own state-machine to process that frame.
>>>>>>
>>>>>> So they are separate signals and separate logical events representing
>>>>>> different things with different timings in hardware, meaning different
>>>>>> things to userspace.
>>>>> Well that make sense i agree that it make sense to be part of the csid
>>>>> but it should be documented somewhere, maybe proper thing to do is update
>>>>> the comment in videodev2.h and update the documentation for camss driver.
>>>> Just an proposal if it is decided the id to be used, it make sense to contain
>>>> stream_id. Then userspace based on the stream routing can map SOF
>>>> for the stream of interest. But the API for retrieving stream_id is still
>>>> experimental and i am not sure if will be well accepted.
>>>>
>>> Ah yes right I didn't really grok your point about .id = <integer> yes I
>>> agree with you, the assignment of port/line number should be dropped and
>>> left @ 0 - also what is the point of stuffing the line id into the .id
>>> field is not warranted.
>>>
>>> Agreed, that's a mistake.
>> Maybe this is a good point to raise. My concern is with the multistream patches:
>> the id field is also used when subscribing to an event,  so it would be useful
>> for userspace to identify which SOF it receives in a GMSL use case.
>>
>> We can leave the id as 0 for this series, but I think we should discuss how to
>> handle cases where two different cameras arrive on the same PHY over different
>> virtual channels—for example, one using RDI0 and the other RDI1.
>> For sure what is currently missing  in stream_api support is the events and
>> how they can be adopted to be per stream/streams.
>>
>> I hope that clarifies my intent—I’m not looking to hold up the series...
> 
> Off the top of my head VC kind of makes sense here.
> 
> OTOH it probably makes more sense - the VC differentiator in the VFE 
> delivering the data but I think we end up debating if the SOF triggered 
> in that VFE is the VFE SOF (yes) or he CSID (no) and if the VFE SOF 
> really transmits any real data user-space cares about...
> 
> Leaving this series @ 0 is compliant with existing stuff elsewhere and 
> lets us reason about the multi-stream stuff separately and potentially 
> as you say addressing a gap in what's upstream for multi-stream right now.

Yes i agree lets move the discussion of multi-stream support series 
where maybe it belongs, i am re-basing them right now most probably i will
re-base on top of this series as well.

I just want to add that we need to avoid sending multiple SOF's to userspace
with ID'0 when multiple RDI's are enabled in parallel. Or at least to have
explanation in the commit message that is expected behavior until we agree
out the multi-stream frame sync events.

~Gjorgji


