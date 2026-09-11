Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665043321DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135566; cv=none; b=tAcySSRDadfilhizZSnN8GULnuZEbpUmD8XFayjdQ8HIvoKPWiYC+qUd3NU9P4rPz6XpAooyT6yIk8Xtgv/Y8oGbjyyc5szMDMJCfCai6HeWCs+M6Flwe1ELDc79aof6YBsZcCxdxg3ndYShUb4etYI/SeCVOIeCGzjiB8uwO6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135566; c=relaxed/simple;
	bh=ulbryzlRrQTqkJ1z6/JkfO6tU92hSZWWHgey+fY17PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2XjeLpQp465od/wwhSBKX0ufvHKzbaAyTBL5hzZyDNgRXz1NL9J335K96p+jNQ/GiftvMxqn1176h2vvkxEL2ahN8aS3LHXcqEY6evhHLvM4FqWdBYHXSnm4z7wt0ecKHpoV02MtW9I/chUDFPzJdKhUNi5moCRuWMrXkYxono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Etfthvb/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMfbelc8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Etfthvb/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMfbelc8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCisrA2978649
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BUKFOWdViEfGfisSzezZLfVxXxk5fHozrfLGvTM+b38=; b=Etfthvb/ZxyB6eug
	s83sTqDaAWRWtdVFzzuRqlXuMKhMcAni1B0AuI8c5otdPabxWGqfihXtPRd4ndm5
	WCX47iIngXgTQ0Ylo4w3Y8hHgrgLwrptCoB6bGTXocscatUTVbmSF8gAjbg5LlPa
	D9+jZSYAHy4W40fxUZp5ywS9yUvwQf1WiPAH5Mlig+D7omTEPSMHHm7J2EcNHtjL
	wGUYXU6geX8utol+NzYTK+/yD4NMGZcvTW/sAbRL8CQNWztonIVNhSFWh3pZvhT0
	d8b8yj/TM0rN3PBmJ54devJTwq3QDnq3866WTZ/amPiMt8XN4Nj26zx4KJP1x7X+
	6Y7YEw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7ucjtrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:05:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78d25a8ff32so213057137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789135558; x=1789740358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUKFOWdViEfGfisSzezZLfVxXxk5fHozrfLGvTM+b38=;
        b=RMfbelc8WJiGKt/hkuNvO7NgA+Mx+ZULHOfEvFq6x4lQFVsQO0voywl5Y8vMJoeE03
         Wi0PjGxoAY4jL6Aj4ixFCwDOQrJgbV7SVhl09IXISGVlN1naoRMBoe4adw+Dz7l9e0+R
         ZmxUPRTGjlJqVrXBfMuXTQuKxxNcb9C2VvGGEAMnxMXCnrSrP9atPswRYqvsW2UQ4hvB
         MoNGQgeY4Kndz6eZv0wWZKBEQ1XdK6PsYZBfI2V3CSq96yOUryEkF87cAoOymmmzOl3/
         UmevVgzQLHaYz35Vl0us0MdReDZBx4zNj8Lic45X3cHUWjHa0gdsFrc2NuqexyWvQpf6
         QRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135558; x=1789740358;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUKFOWdViEfGfisSzezZLfVxXxk5fHozrfLGvTM+b38=;
        b=o8dD8y8pL9Ct4aJOcWeTHHsYBOflrqTTgucds9iIaukyiXlW7pFii8+Vq4Dff4spc3
         cLl9e4d1ODOA4DqZ/jnTih2p376/YKkd6DA7Xe4dfl5AF9VunyrgbKu+Q0AoyV4CXLg2
         4h1xeUuPGWcu8/3Wnjx5FgzppU3nL35l0QWTBowhVPF873vEoADoFYOW4Vd67DbCW4rq
         TKu7S+zoQSiGZFEYbZm+TX39T5R5CjP6rK1qkYs03AwOtwPe4SF6Zl2MYPigZwY32rN9
         CwBdRgpVztticnRg0imRudCRqMEbv7HLAnuoVrKhhAQ/ffaLHLdg5R4FL/chLXFjyQRz
         fQnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkn5e/zjQikKSWapM4S2FN5XJaazecMJFv8E8/RuH9yXS3Gut/EM+vEBQI2n9RE7QzcotDffb2keikUKuH@vger.kernel.org
X-Gm-Message-State: AFuF++nX5SKyl7MsQWSMm6GsnZ2JBCf4lNtTXkOOfQQTvmJcJdWI+yBq
	uk7156IraytjGesJnBXpPyLW0MkzrOAafgY7dexDZKJwfExEvMJR63gE8APecHMRlXl0L9uzTvL
	66nDu9hH8cybScHuvaBuR/C7j0W4CTSB5ZV5iHfJy9G7F6ZKIvsxnqYITgd4CGbmFz9dXb3cCoF
	NhFBc=
X-Gm-Gg: AYBFou11n4Ou+RLl4jpCnedSYIPKh4n3voO+sD+Sjxn7/STfoC4XK+l270LAxuXByRU
	dhAtMUecSydIfe6aylHQLGXwkkY1JN6+bvvblV8TS/lXyFCaG+oAVEVnLDcU65FrvyK+JtUzNkA
	X62A/5YkCn6KjNoziWUlVxFHmSNgD0bJMh2p6/QsYVZSCpA1FXwVOjm629o57XrTE+nvgu95vUB
	eYcGCDvJA4zDHNzzR9pvl+3B4fd9bq3aIKAvvuwSTOj8DESbSdBeuHzrZ8q3wGtsBPR+CHN71Wp
	f7Zou0qwMlODVODnNC5r4KzNTo6OBSeyMMWOa3Gww/Rpg4vnsqghrOQCK822GUOJwPA6HExhZyZ
	DkyCke+VPoigKeD9SxELH+jtJQA==
X-Received: by 2002:a05:6102:55d1:b0:781:210d:28aa with SMTP id ada2fe7eead31-792a50c100dmr3782334137.2.1789135557458;
        Fri, 11 Sep 2026 07:05:57 -0700 (PDT)
X-Received: by 2002:a05:6102:55d1:b0:781:210d:28aa with SMTP id ada2fe7eead31-792a50c100dmr3782252137.2.1789135557001;
        Fri, 11 Sep 2026 07:05:57 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm48067045e9.1.2026.09.11.07.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:05:56 -0700 (PDT)
Message-ID: <d9201e3c-45e7-423b-b81d-4d817fd8c8bc@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:05:52 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] media: qcom: camss: Add streams API hw_ops to CSID
 interface
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-3-gjorgji.rosikopulos@oss.qualcomm.com>
 <87e34805-e56c-45b8-a3d8-458ef17b92cc@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <87e34805-e56c-45b8-a3d8-458ef17b92cc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa40ac6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FXOfda06WdeUfy0AeUkA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5NiBTYWx0ZWRfX72i1qfA6ZfOP
 FWX+a3/pxFxXtVpmr4OVO51BfUL9WUMy1AtSIT1i5Mf8J7dW/KIFHvCmswYKwFtcewTnJKpO5OJ
 iPHDk9YoHhiAZhra7Zfgcpz8B7Ka4vtlM8QtnwWcWUsrgSIb1sdoiwjfRQBzkxr11UY+vuqf5Pw
 iYkbpEJqh3HRPdAaeP+YuaPQ+YBLuqd/gexqG4OOm6ZeFAei5A5mKwFZaweaigRyieZuPu5529j
 NYmd1TGtSko2EUPoUPk3YqnzPRie7CN2OkWQb07VyIEs4nfraASftxvqTzxZT6ihgPx4e0W31LZ
 MZzu/KM8eyJYthg1cIFVt1Ghzu4sqVebjNzOZ+6n/8Ny4209pKErod44bcQp54Wi/EDuSX0wyOz
 N0IlzvIsVYzRs8ghg4NtwQMRqFh+RSgsBWSJUhzxGOPLS8kzhmQzJzObdn1dpbWNxHqpaTnv7U1
 +Uuw42saB4FNwokRgpQ==
X-Proofpoint-GUID: ywCFPIn8sVYXBowWG25wQk8ZS-BG4tNi
X-Proofpoint-ORIG-GUID: ywCFPIn8sVYXBowWG25wQk8ZS-BG4tNi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5NiBTYWx0ZWRfXykqDZC59X7tS
 7Nx3ekAFSZnHs+ejnuYiQfR5GWU1P1w19q0a370M9hmrSD2wWm57W1GmZvW1na3pIRydgBOYD78
 JxKy2cp64GHgBa8gvrBw+79eHiqGGag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110196

Hi Bryan,

Thanks for the review,

On 9/11/2026 1:43 PM, Bryan O'Donoghue wrote:
> On 11/09/2026 07:22, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>
>> Add configure_rx/enable_stream/disable_stream to struct csid_hw_ops:
>> per-stream hardware operations needed to support the V4L2 subdev
>> streams API, where the CSID Rx front-end is configured once
>> independently of the per-stream RDI programming.
>>
>> No functional change: these are new optional hw_ops entries, not yet
>> implemented by any backend or called by any code path.
>>
>> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>> ---
>>   .../media/platform/qcom/camss/camss-csid.h    | 43 +++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
>> index 5296b10f6bac..90ee611b9092 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -74,6 +74,25 @@ struct csid_phy_config {
>>   
>>   struct csid_device;
>>   
>> +/*
>> + * struct csid_hw_ops - CSID hardware version specific operations
>> + *
>> + * configure_stream() is the legacy (non-streams-API) path and is mutually
>> + * exclusive with enable_stream()/disable_stream() - a given CSID instance
>> + * uses one family or the other, chosen by streams_enable.
>> + *
>> + * stream_id, as passed to enable_stream()/disable_stream(), is a hardware
>> + * RDI/PIX port index in [0, MSM_CSID_MAX_SRC_STREAMS). It is currently
>> + * always equal to pad - MSM_CSID_PAD_FIRST_SRC (multi-pad, 1:1
>> + * pad-to-port mapping).
> 
> Lets not mix and match names. There has historically been a huge amount 
> of sin and liberty taken, not the good kind unfortunately - with port_id 
> and write-master.
> 
> port I believe is the misnomer we are currently stuck with - so lets 
> continue to use it until a more crisp naming convention happens.

I agree will switch to port until we have better name and change it everywhere.

> 
>> + *
>> + * configure_rx() is called once, on the transition from zero to non-zero
>> + * active sink streams, strictly before the first enable_stream() call.
>> + * enable_stream()/disable_stream() calls are always made under the
>> + * subdev's active-state lock (core-enforced via
>> + * v4l2_subdev_enable_streams()/disable_streams()), so hw_ops
>> + * implementations don't need their own serialization.
>> + */
>>   struct csid_hw_ops {
>>   	/*
>>   	 * configure_stream - Configures and starts CSID input stream
>> @@ -81,6 +100,30 @@ struct csid_hw_ops {
>>   	 */
>>   	void (*configure_stream)(struct csid_device *csid, u8 enable);
>>   
>> +	/*
>> +	 * configure_rx - Configure the CSID Rx front-end
>> +	 * @csid: CSID device
>> +	 *
>> +	 * Called once, when the first stream is enabled.
>> +	 */
>> +	void (*configure_rx)(struct csid_device *csid);
>> +
>> +	/*
>> +	 * enable_stream - Enable a single CSID output stream
>> +	 * @csid: CSID device
>> +	 * @stream_id: stream id to enable
>> +	 * @vc: virtual channel to program
>> +	 * @dt: data type to program
>> +	 */
>> +	void (*enable_stream)(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt);
>> +
>> +	/*
>> +	 * disable_stream - Disable a single CSID output stream
>> +	 * @csid: CSID device
>> +	 * @stream_id: stream id to disable
>> +	 */
>> +	void (*disable_stream)(struct csid_device *csid, u32 stream_id);
>> +
> 
> Seems odd that none of these have integer return types to propagate errors.

Well initially they were int indeed, but i get some internal review comments to switch 
them to void, currently the implementation is writing only to the registers. 
So i am ok to switch to int return type, other option is to leave them as they are
and if needed in future to switch to int return type.

> 
>>   	/*
>>   	 * configure_testgen_pattern - Validates and configures output pattern mode
>>   	 * of test pattern generator
> 

