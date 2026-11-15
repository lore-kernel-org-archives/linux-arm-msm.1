Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776644;
	b=2MqxfUQipf1/KyhYx/vAgOpiyWk1bO/+EBZ/5lOJF2HEH8sf141hwBT6GPKV5X1E/Jlv
	 O+tRxpsh7IFMmwZM19i2rBE6IvOzOSeUVnuYhBwPXOljE5UAtqel+DV6IIWNalEr/QWF/
	 ZdeERZNmVSDyWFLpnsv8hJwQcHYnriIoBFUxGagEWLZeyZH5P5pCTMHduXkIqIlWJAmrY
	 wanYG5Qzt1kIWdUelQcMhBQFglaVKs7Ge0MahEKFOTq6hCY/37X+U6CA0CszZguhN62dI
	 qCkO5z/YvW7swopv80N8hVcLgG4tjhrsvtIGTdyDsoGVhVnnHz2qe16gjr/rtEIzs6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
	b=dB8py+/z9zqUwvQG3UuRdQAEsJEiRkmYPvDR0Vr4iVlRtG1JyD9dUsz/QR0flvKMEBaY
	 jozA6mYlcEh/nSVx/3STndUwWcGwDjfcrG/vbG+LcgRF/wD32SD0v8OAM+eWTY9WA6BOR
	 irlUbfyhl3LT2jSX//8UzN1oBTKtpiVx9ZzBxzhIzVu2wL4oJaUF0ijT0N5SOs+tCSEAg
	 LkHvi3nvWHjQ19zzDa94lBYk8U1jk92JYaqWRigGrSg8lqZ7y/ed+8vWGbDZOuM9uYnrh
	 fKFm1ZzflKI7Sws46UOUJLX/IqY18h/599gogK4oKFzQ6gsQXp/b686HAZBN3d5UGOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIyRG5j3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GlSIT8gE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB544606A323
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB544606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIyRG5j3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GlSIT8gE
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIQjVc3041710
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=; b=kIyRG5j3dYGOflKz
	T/SJjWzn5BO2NwkWRAPPvcI0paR3tQ9SoO8w2rMVBEPh9gXicFfLqYUkBQdAFUzA
	PjoZQyi9pWqdZ7ia2WQz1JhlYRHQ+d33XHAwCMsfGVg7F50wmOog7dZCe9kBiW+Y
	bBzkCiBFrzx+DfWdPAfM2x00H3xt7TeuQEw+kTG4G9aYI2QDg55JCMAjS2dJ1aQT
	xegBQ8GmK6ZU6lE0+7clSV+lrcXh1XiEhwyqXyR1UTaqUPx5400lLNRZid0ghgn+
	SS7fedKzqVIfQk67OkECg8QBxcZmna/0977iJHgUNhwBsdKDhUyZgVFstZnzgnp3
	cThh8w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqkvxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9997828d6c2so257055241.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 13:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776642; x=1795381442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
        b=GlSIT8gEX9eSZ261jD8Sq5nbIIktFnSK6z/TuF7GqMC5uazBU+Ptgq2LFTCTb9Wc1b
         QJh09bCMizRBBvBlgA56m7pl7Kj6mLuXR79F23T87wIesd86pSyozl3f8eG/maAKvDHo
         aFPb7PgkbH3i7WuN484k+QxqB55RsfPmh5p2gI6cWZfb6j49Kx4Mtlru0ubC+KT6Fhcs
         K9e8VoPf88HhUjzYvDKgsYzCtrEgDhOWI+/ue/vMWh6lK2y7v8eAMwsxsnvT85dXl+08
         fCyYMjPYoy9/whx9kNPO5hNiawDJXz8trH954TGXw3mhMXgkEad4htegWnrFPRHvNoc1
         iL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776642; x=1795381442;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
        b=XcGvNDsMX50CRqeuL/nJwgMO7GvCM4+7OJbiMLrfeug/MFEjFVMt5LOTVykV5wdVxx
         E73Ms75c/5YcAANsvXzdMfxQ9ztu0UXyJjmd2UfCIvdgoiwsH223iph0G3eV2pngoa7q
         R1k1hc4NbAVTQJVXlIgYI0oaSQvbNabYyBkAB4uFvzypXGGtiK61voxaO2Nh+xBfm1Oe
         yX2agBv0Nz/pUwXqxMFlINj+CMTzZBzCseiEMlN3N/CseA8ILWW/HetOwfhLcBHQ8VOF
         LtVtAOX4mjF47/TO8m9YxnfXTf51asGso5VCSJz0nzGIY+gOcfaATl3YGt38tyC78rzg
         XlZg==
X-Forwarded-Encrypted: i=1; AL+hErF7QDapeOE3cGRuCN50ozIGFpXwdbUSQr1CwxTlk+MZFusRG99O6eGgnPlIEDHNtcZH/7KIcVFw+LhDQHSg@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wf/Q3/YECU68rdyzgSVigTuwZ5zEzSjBZ3Iun8N3XZk/P2Q+4
	0K+iA6RoYybOqY6B2s6miZCdMl05m/ZfqFBjlio2Pr8qEkTRWhiBouwMfPHADsjqyhyW2xk97SD
	Myk+u1DWgcW02Xc7w/iAhbM+MgNh2HAXTNJpNdijWEgEEEx80OvSkL8ps3ltwgy44gY2X
X-Gm-Gg: AYBFou2yd3uDzljCjie8CjAEV2wjRCc6QtYwCh3VcFbluAeBjQSMhZu/aE25QtN2chM
	XHubBpU8TsD7AXDccQrqQlcyAXdJBgYCDb7z32gNNzvOMxMQqcKrAv3/Jn+9lGfRSn7D+KHi6my
	ePSaAmSKVTvwCjZuUj0lzvvxKX7R1HBs2z7TZt1mEFysMyrmLyLmf0siDcuJuDnYl6jl5PkGq70
	XxmzUqcosMunJRUwvaeDBTrGYexc1T+jVTFan2++gSeHiFBH+VEXAZA87p9EKHdNcykrHxCS6kV
	KmnLNtFneVY48oTjT6UuNxbb9p68VRE/0KF+uGvmhVFmWRJoHL3YPCB+U4XA5Kmm3Gs+8CJY3Tz
	92z0leRr/ISKSeFzeYnJjjTI0/cl/o9N5tb0AfSGvE/G+CgKwS4kHg4Taxl/UxaVlcNyQmBqg4c
	Nj
X-Received: by 2002:a05:6102:94d:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d64d6ef8b8mr2317673137.14.1794776642100;
        Sun, 15 Nov 2026 13:04:02 -0800 (PST)
X-Received: by 2002:a05:6102:94d:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d64d6ef8b8mr2317658137.14.1794776641568;
        Sun, 15 Nov 2026 13:04:01 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:00 -0800 (PST)
Message-ID: <c86bb364-0a7f-4c7f-8ace-586f5aa85adc@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:03:59 +0000
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
Subject: Re: [RFC PATCH 05/23] ASoC: codecs: wsa884x: add VI sense capture DAI
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-6-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.10822957842494469444.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416982.140154.10822957842494469444.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afa1e42 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=I4NBp-wbhaHMoEEwmPUA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfXz0w4XWIQQ8TT
 YPNFI5p728bbFOBZG702ioWrfWrYjM3xxCvRh/48FqqcNaMnOVKfZF+rbA09PJBYbVpc74iH9Lh
 HJ4S0J/BDdSjIDvUBMjOxGkMcTVDKXo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX7HI7ATpupPOv
 uTe59p+x2y5nc+wLaNhEGXWBnD+4bUgqb+jBlNQ0/G4x1jMULzf9Z66aA6oDwhMYSfhHYp9yV1j
 jLBTnqCBaprNclbp/vhqGghIAojweGCJonbN/X3B4n1DYvVVMS+OPPfI5KQYdAvzUYEo837ZsTw
 T7H4qCX4IA5PKvBNnCEKDRpZhCVPzTqyk/y2L3UvJe6liyFFrYOzNGDEjy0+M0ORZF/53aNr/9U
 VI8cdPIjaL8AAfXWbw4/Dq63RV73FNH5B7FdqTgVtcvxLqH7hN4IbTMYAhskYrWjQw+kQ1me5Eb
 Hr3QBBCVlnFwIcLjBwywAhN1NhMhraJDrT93QpIqd/VchGn99VDY2FanyDkpWkj9iixDEXMnW7t
 NTnPXVrp3zm4dB1IOS1dDhme82/RRoSRBI37mFkRDTCKElRX23mvFS39M0xG4iT/s4zx1kxOoES
 plR6cayans6ftL+njiw==
X-Proofpoint-GUID: R19xNSPJPqKAsYTNsPHTAcYD3TtXR2vw
X-Proofpoint-ORIG-GUID: R19xNSPJPqKAsYTNsPHTAcYD3TtXR2vw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> The VI sense port carries the voltage and current sense data that DSP
>> speaker protection needs, but it is described as a sink port next to
>> the playback ports and has no DAI, so nothing can capture from it.
> 
>> Make it a source port with its own capture DAI, ops and stream runtime,
>> and leave it out of the playback port list. sdw_get_slave_dpn_prop()
>> searches the sink port properties by count, so pack that array densely
>> now that VI sense is no longer in it.
> 
>> @@ -1795,7 +1826,10 @@ static int wsa884x_hw_free(struct snd_pcm_substream *substream,
>>  {
>>  	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
>>  
>> -	sdw_stream_remove_slave(wsa884x->slave, wsa884x->sruntime);
>> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> 
> The VI DAI has it's own ops so it could just have it's own hw_free()
> which would be a bit less fragile/surprising.
Agreed, will spin that in v2.

--srini
> 

