Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616922;
	b=X0lrzXXgZJ5hqgXBArVgFY3djqs6qPNW/rEqD6mY6NlqKNbltWDsG2X+J+Nlz23t/QC3
	 oAFCySIlKBW2TGBfg1BsiExm6uTXdyfAa8FmsLsRpz9sXcHf/Sxv+BkVQpDMoHFlD8wwy
	 as7loOvG2TiIYUReubY/n07+Iee4fzo+ekgIQC6etGOZ75OmcutAmxfFiR0zoJ+/nuIl2
	 F7q75k5IAl7ql/CdGl0BSA//g3Zfiq3N4bTNTw8RwMBbKLEgdupoG5GZN5fQ5t7xIJsjS
	 kFhIAlo133hevMPsh/k1PJ2mjlDhw+Rf+4QniFR8MrvtccNubGT9gtb955NnTz50t8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616922;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+g4RtcpsbOEJna1NU7oN7OB6+C78U6kIVa5NdLfGLYE=;
	b=PHgGXhDAYJFbn/RLRzeLoAMP1iVOaAv0JpYA+K2DH+fkBq2VZ3vNdobTbZ6IvxgZ1rU7
	 1AdKqfbfRoAGUguBtsHfLuhmZ2t8VtTL71ffFarMBZ0OU4Ya6MX1LGQgQExDQX8Qy14Hh
	 lFk69I/5mZj/gZzO4n/fizOkxJ8KED/ECivcYt0PS21BH77JNU9pZ80MXEY4gh7iq4K5N
	 DMAiUcNavRY+wh45pvN1cjesFSZeDQPmSpGqo2TGbtYLoonInP6DAxqxc16G2eXFICAdg
	 ScVo7GdjhzV4HWhtU088ujA6OlWaoMpcNDrczPrRNvyebmqiU/XKaaxdZlO9x9MyNqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AogXHSbm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAjjtJ8W;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D62606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10D62606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AogXHSbm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAjjtJ8W
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A3Ce2466298
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+g4RtcpsbOEJna1NU7oN7OB6+C78U6kIVa5NdLfGLYE=; b=AogXHSbmMq6jzD4G
	FpC2vT9N2l2ssJoU2GTqwwA6aVKt62y/VCLyquDPzKg+ACVhTJxeGPX363wT4SK6
	wuvN3/6EORHDsXpoMFz8MNcDyjmIsPPFQEqwJ7n9SCZisyk0qsQNxKpZzqtcq21Z
	2neDglkb2wDs7pGwa50igsGCLJjv84KQanQhD2hqrJ/dqxyLhdbIQ2/S/pcO3WID
	gMcoTgBxB8KfvnNXmfnmoOPGkMZREyO4O7qB6KtZ60xdxLtIOWUqysW0F8HestKJ
	dw9o35jvJAE1YC+Dbel+RMWVzYexXlIokLqD06JOanCK39gjfkhvi/O7SCCkzynd
	63K05g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhe59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:55:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so4131205eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616920; x=1794221720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+g4RtcpsbOEJna1NU7oN7OB6+C78U6kIVa5NdLfGLYE=;
        b=FAjjtJ8WeK2ThK8MQzk/lWYCPODpmv3wmO0Q5YEdHtWN3x35/v4OntruiQncHjOOOQ
         Ess71qqDU8NhV4IU0B9crYRkBBXfd+OAyBlkeeYhwF4agw9sqYJqfVEro3CUwCm4+5Ao
         Qyr7Hab+/WEOzENiEpa+eALsan3t7gSTPErgX+v/5SLvf8QvMUINmZzCkHvhY3jv6JK4
         yeAGlaJD4bFb1zftPr9C20SYOjIdP0MTstWTRETOtnlKfT9T14VAYXSxL4MHqzcT3bh1
         Sw5PEh3SvsAwpA9mc/4Im/PVoGJM9YBQl21G5TS9syhHJ/i1GxgpeI6QSv+nbZi+c+Cx
         w7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616920; x=1794221720;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+g4RtcpsbOEJna1NU7oN7OB6+C78U6kIVa5NdLfGLYE=;
        b=SqmwHSR4gTHi/usn3IONy3rTZb6VSpXPoRuNcP376N5DZwljrhjO39ueNIS9HEDak+
         gmVPFDT2oR5d+6VLbZMAnJozdU+CRaJ/P8AAF8BbykmR08EE95ctFHED4Fe6eEGWp3h+
         Khv/HrpA6cHrqlfuJAPb83ZgdpZdX/LrUg5CzekJOOWXYschzMGYUCpJDPqVMhPJCo6e
         HZMkYA7lGJZDYWhvtaDsYNEpn61n2eEt4dwB+kxCBTSd33lPTiq3pFcLXcErzL5jtRLJ
         X0FbJNLKhO2UyCfulEhrU66jpvAttAzhM7n9gJAcwEvHjYVwtyxvIAyXP94itZEkf8AB
         Oapg==
X-Forwarded-Encrypted: i=1; AKwUvByKFuaVchQ/u8tE3RRjH8SaZS/pl5NqPQl1j15MtV9VDYQa6hxwuZk8L1ruR0+NsWEDbYDSGCOLUCsf+Cmo@vger.kernel.org
X-Gm-Message-State: APuU4Z/tKKfQCVz0CQW1/UUkiN10lWqc5fnxXc1U9EmUchBXLSXtAbvI
	Zk4a3s5SRwdKFAuJ+IeunKBO5QPQTxJq/LNrPWo/yKs37GuFvYue4l7cpndNhoqJCCwQfhq6+VL
	Q3fRFoIvdDnfD/rFYCfWuIulcWKyKbkhLw6Bnne2LFt8Umibewuqnhd7+7+fK+NNqzd9cfWmQEV
	xG
X-Gm-Gg: AYBFou11hBGHdsboplKDJYFl23ZZY1TdNG8BS6rRbK4YuoACnBe/j4wTdzTalVs4Rta
	Itrr6+Dgv7H9GY4VS3NCLkoNhCifAsQ2EOE3iN6avTc0Gi5xBUuHFWRY6mBx/N95WuG6wIp0aWu
	0nhSdvcqdK5s5NO5WxUqUCzWsD5QYIF7o3hH8ezQ3S+zOZb5xX3dl90R7tJdkffx2Ft7qntGmI7
	6AWTBK8mCsw/Zp+3ekveY4zRNa3HJI9+SZCsivefRR5KFDhuVDwCbTbCyJduEzGRZKsOsyxhXQD
	QGNYYjhdyHXn1nSde0rF9Fey241h8+mH2NpRt4yCrWkUNvpiTvGdBdjIMrz5gGFtTgR4sD2x4vr
	C5Mqile0xckpfeSJWRK0NxjFuCAmzQnsFYmSoHySeENZcV25bGqPl5Rez+Dh3gbiIVvBnIqz1au
	pxr87bVVFLcA==
X-Received: by 2002:a05:7300:c00c:20b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36a422039cdmr17301658eec.1.1793616920494;
        Mon, 02 Nov 2026 02:55:20 -0800 (PST)
X-Received: by 2002:a05:7300:c00c:20b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36a422039cdmr17301615eec.1.1793616919790;
        Mon, 02 Nov 2026 02:55:19 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm38286105eec.9.2026.11.02.02.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:55:19 -0800 (PST)
Message-ID: <fa8bb99c-6f85-4a83-a920-227991303d57@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:25:13 +0530
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
Subject: Re: [PATCH v1 3/4] ASoC: codecs: pm4125: Keep the micbias reference
 count balanced
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
 <20261015-pm4125_mbhc_support-v1-3-8bc1212db6f7@oss.qualcomm.com>
 <a3df845a-ab58-4945-9221-ff671c3dc378@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <a3df845a-ab58-4945-9221-ff671c3dc378@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0bsaaOGRkcAMQfXekmAgrkOSJMTlRudr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX/gP59cMnuGdn
 JvtUkhwoM5hVIFDHiXntsmVsTFD5mMQgrjXoj/GQhMXYPhSirhk9tsVIqFg1rCw36lmIi/TWJVD
 cU0E3lE6T+J3Bz3alsXokDHhQ9Hg+CiH8d1wNNNZ8972ARVpUDWZ6VgHgJW8OKG53/3st7lMxn5
 ieb5otBhQj7UqN45jLhE364jJjog5RIZd4sJtvwvN/waN2lOqDuf5PK43j/46BiOMAswQBeMTun
 arD99ITO2PuXp5R8K76973fLNdnkzZMQhR1d6PgKWPodLoNQ0ECSt5UtZ5jWCpFlSzBDMeOg6jO
 uJkiFQhA8ohwUll60vnOHIA2vjOc664ZyzCE2oQeGaEr3hqIzt1JhBUnEFyeuMcF3FtW87K/T4U
 gYF7NMCPNSw5Sjg2ebr4SyMQsgmprzsH1sG6s2IBgJHesAQBUjiXa2FUS/cDeQ8yn6lewoKPfA1
 c/9GX3MitNucVil7yfw==
X-Proofpoint-GUID: 0bsaaOGRkcAMQfXekmAgrkOSJMTlRudr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX/pQ1yWDbFkS1
 bDIdooNfK5BlCejRnY5ivbVUyrMiluEkwBNRPpWSRzMtt8uNucW7QwXov25qE288EHNE8LycCNI
 XTqsuUQ1dluo1wy5zcBxDX2KqfhgsYs=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae86c19 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=cy-uCPSrX33jWG4tK70A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020043



On 10/16/2026 12:33 AM, Mark Brown wrote:
> On Thu, Oct 15, 2026 at 07:43:11PM +0530, Mohammad Rafi Shaik wrote:
> 
>> The analog master bias is shared between the microphone bias supplies
>> and the playback and capture paths, so pm4125_global_mbias_enable() and
>> pm4125_global_mbias_disable() reference count it and only touch
>> PM4125_ANA_MBIAS_EN for the first user and the last one.
> 
>> MICB_DISABLE clamps the per-supply reference count at zero but then
>> evaluates the enable and pull-up counts regardless, so a release that
>> has no matching request still reaches pm4125_global_mbias_disable() and
>> drops a reference it never took. The MBHC framework issues exactly such
>> a release: it takes MIC_BIAS_2 once when it starts detecting a plug
>> type and releases it both at the end of the correction work and again
>> from wcd_micbias_disable(). Inserting a jack while a stream is running
>> therefore switches the analog master bias off underneath it, leaving
>> the path up but silent, and it stays silent until another stream takes
>> the first reference again.
>>
>> Return early when there is nothing to release, so the hardware is only
>> touched for a request that was actually made.
> 
> This feels like a bodge for poor reference counting elsewhere - in
> particular the MBHC seems to be fairly clearly double freeing.  The fix
> here just silently eats double frees AFAICT?

Hi Mark,

Good catch. I’ll check this and fix it in the next revision.

Sorry for the delayed response. I was away for a few days.

Best Regards.
Rafi.




