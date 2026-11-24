Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489810;
	b=zbZg2phof5ZZ65JKPU8c48GLoadtA0EnyPWqv40P5F2PyO0YAHlIYyNbWIF7q6gwKms+
	 S7WrlermJB/SZ1IREXMgVZpinvAVPt2PILTDxETdGFnssyCjexnKHzMyBfknBkDhf4Dml
	 9wzmDl3p4orDWG/+OZzkcvsfW3mYcfcn/V9nzFks5HBSaLkHDV4W94fAKsvgr57rwUttq
	 +r8WtAHET62ZeiplJLlkTX8+rxwxQTNF7Wpy58JBpU99YyYf4xBfduJ30EHw4zenHfB8j
	 7NJwHvqQ8E0GDeYHPSgdR1vZjLDhPjBKtz+inTVaSFPq/89uumyH/bN8M4npXmNpaYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0SW+r6INMyfKAJrCWPlacgZ/AfP72UDcjJhb3l6CPuE=;
	b=ugYfufDEzrwBy77M1HcUnatmKudVtRqbJxgF0gAeGswmsI1zfW3G93AD/+qQuflabLS0
	 qtvTjJlMnljQ+xHtR9yNvRDZruq+Gcn/kB2G/EQclyCESUxwGRvYCsnEq0pAf9EQDlh1W
	 tj7ut8dxyY2+u+xWy/S4c/rH7BpzZn1+vPBfluphHNAg4vC7PAmLf6rWKFPFG1b7zGm3u
	 7qaIVZQfU3vDp3YMILW9XwYU01CSk8SUZI4rxI/VgkAH0cumWDujDjA6txSuxn7vHieDI
	 mCOboeuPbrIylrxP3Wtdakv1q4Nu1XVRpd4RNHHvzYo3KhhCse1yX6EMMU2S+oCbyVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgA7F8vZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxha15Ko;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D522606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 03:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D522606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgA7F8vZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxha15Ko
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kFr3646678
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 03:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SW+r6INMyfKAJrCWPlacgZ/AfP72UDcjJhb3l6CPuE=; b=SgA7F8vZYCl2eqhk
	Scqa9m7Y0kpz3s40wNs+bogYGfHThXyha2bNQyEtkVMHWn/0n/DTLJsdWVdAY4Bo
	Rq/WqAamOTw8+2Vq1eS9ARL7XXIsfEiIGk2o0eMQ1mGDqca70DLOtO8s/4Q/oAft
	48RYZyyTprsBFNKz6euynZEp66X7iOAuYnHO+V9CW8dAVoUrbYZtZwqMy1jycfLh
	Y/W7Ar3N2uGbJYPCFifapmjIiBeLdqLOXbz0w+gm0r0MGC01mUPPSlpKN6yqm6OV
	hf50Zb4DRqOBCLKvgL0qMcvqutPcA/AsMi1H56yrWUOQB5Ztv28A/HR137/tfH2c
	k9kCHQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd0gat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 03:10:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so4453751eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795489808; x=1796094608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SW+r6INMyfKAJrCWPlacgZ/AfP72UDcjJhb3l6CPuE=;
        b=bxha15KovaW9h5pv4at8q6iqDyGmb3/N5WC7A20k8Z127RD7v5VGaLgApvhPV/U+M5
         bKadqMvSffGSWSz/psegRwkEK9R5mosT5DS0mXv19A5eAOsjJcHvgAb/QOK/XLxwANAg
         z/Qg9d69Fg46JuHmkCp2JMFrNpmnh+dnKq0sYOCt/gpu4sUKRRGyqzspUcr5VuoYRCRF
         8KQ2HFJo+ZKmtl6wmyjSh0Zh/R6bY3nlzfcAwfwcuAsJJhRd5hcGV4E9qfiW5IYktnK9
         wjevLybuEUK1mTvQ8tcLoJ50MmA6we9PJIzUzRnX34+VSwrmechCFpVmm3M6hm5MzkPE
         p1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489808; x=1796094608;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SW+r6INMyfKAJrCWPlacgZ/AfP72UDcjJhb3l6CPuE=;
        b=YcRB2UhbLrCLEX14KA/Pd65VAq6b/KGgLoei3L5ZNRGdiwgADaxOmu8VOoYOJwDkyi
         IQzZLf77PHxIU11ofkSbWkmZX4xDnIzyuPFCiSuZqeWLUX6p7PVlEdo2PdJSs7hujNqg
         N3GzfWnfF1Q8UXmrqhESChTYOFCa6mYc7LULb/Onmwp4mZriRugRzo6/MSMzT3grcKrh
         k2ceDWN8wWuLPPDknoX4zmJW+u2rLoXhZx/qa/dqeBj5scq+Plg2sUkjBdcQ1pNan10I
         11b6mi/hBRvCFzNsh+EakKmV+t2f1EI1b7G/MY1clbBKgAZ2QrQmEXXkjV+VwumAG+sD
         Wmsw==
X-Forwarded-Encrypted: i=1; AL+hErFPn7edoA81CEvCBhNIaKcfQCpoG62ORjeFoqvx0qX2EZMc9aae2BlzId6/6DQqD02p7PTomDQb5ZwXU87Z@vger.kernel.org
X-Gm-Message-State: APuU4Z8FbKSVMRKnWyNZoUbW7bH65MH8QVC9AoHKR9XhjEEcv2J7vIzu
	mDSTVByee7RtjEx/0QE7oHfRwWJ4jgbWFc86XbX9j8GqjofNXYi2moEwuHD1FQ28+g9XgP8PnSf
	nQ6I5YXYG5DlVCj/HCHpGEesVVDX8f1GnrlomwyOysRwh7wbUbcIdwmtq69dJD5Bz43aQ
X-Gm-Gg: AZFdTZeW6FUE+c4gDHq56ukiWlJIGTe7lzmjWoyzHATHNE7Y7n1I9Oke94JZBhCU/kx
	51ZRBEUF61h+paFH9fQPD23DLKXdE2XgkvDKRb/3e26bS7ZAcZ4Ceyo8XHoN+GphTVDKWr3hqbo
	lHpSaT+Q5wDuOo297BpKIE99r+4Fp69NAaw8MJ0aggVZ5Xd4PzouCa2y+uI53aCv1SvtHoRpGA6
	m63reOJY/7SRPzcaM8ubBypE+YBNFNLRYr9usui07IN++H2vLayOZ3kHutE13LgIf81ZqLorBIW
	Rp8GdqBZttLokYYndmWhnodDrhagHtZGnYVWPUihPZURBhN/WPlT3S9LFGVXEZI7LluYGRpUYsd
	6t8HRNcgSNMD89qIupB1yvZ64SbdaI8G97L7jdJ12uRHHE1CC+2/8v1cmoZgTuQaiJox+M4re5T
	YzCZ0cqw==
X-Received: by 2002:a05:7300:a228:b0:386:6685:1492 with SMTP id 5a478bee46e88-386668523cfmr12340349eec.12.1795489808082;
        Mon, 23 Nov 2026 19:10:08 -0800 (PST)
X-Received: by 2002:a05:7300:a228:b0:386:6685:1492 with SMTP id 5a478bee46e88-386668523cfmr12340327eec.12.1795489807624;
        Mon, 23 Nov 2026 19:10:07 -0800 (PST)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm36076974eec.2.2026.11.23.19.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:10:06 -0800 (PST)
Message-ID: <bdddf7b3-76d0-a8e5-2c9a-c23953e6b97d@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 08:40:00 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] media: iris: Skip redundant decoder input config
 params
Content-Language: en-US
To: bod@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
 <20261031-fix_dec_seek-v1-1-cfedf0c267ee@oss.qualcomm.com>
 <179492375803.2846709.17266637550647614190.b4-reply@b4>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <179492375803.2846709.17266637550647614190.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b050011 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=RZcGvm1UZh7VgU8MZDwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX4l0voHXUVMh1
 47wAh0ZvCwVKLCIPLr4O5LK2ENglUI84iDbYK8haf84HiN8qbNy6sq1mGsfZL8wbuSC2vZqO88N
 gddVFFjux7OXvPjjJisdMPHt/MRUWfkZBG7JTevWF9PjxKf4iGsL1g78xpSMLfHWPbUBi8K4gA6
 ccj8Jr5rbtfMcbGIZFX8AKnHb1OFBvUUWJmOWWQIrwDl6k2ai+kem3WkW140wOdI3cdHbnVafQF
 DxkJln8lQeW0pI9fwishIozch51nMmFJFKdrz5q2pFMD8EJ+/zS/WYhoZwDohCZyWzsWRO3GK9m
 CzsSyeSA58dhtrq5DqqDB3gj6zznmUfQ+AJ9vpViPf5MGRXYoqhEFuBMHnU82CPuctMnsvu7vsg
 GTIGoonWZNEeRbtBSF8JgnHNa7NxOGfHDxMXcrkVHUTghh23JD3ga095xHNQb/coHZp7UiijRbd
 UqLAMFi+kjThRW04fLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX7uZK5P6P0ArH
 8vfPv4+4O+P94nfytu8AeCx0sZW7btW0DwNz6JETJuhcRkxtT/y/VIRHSetW7OLakHLfUPdQpLW
 3XBECtWtt7jkUXIHJzf4fxQjeEYFR6w=
X-Proofpoint-ORIG-GUID: nbuSZe4eaaFbD-sKONoChFN32KLDmqKV
X-Proofpoint-GUID: nbuSZe4eaaFbD-sKONoChFN32KLDmqKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240011


On 11/17/2026 7:25 PM, bod@kernel.org wrote:
> On 2026-10-31 01:49 +0530, Vishnu Reddy wrote:
>> The decoder input configuration parameters are sent to the firmware every
>> time the output plane is streamed on. This includes streamon after a seek.
>> Resending these parameters generates a port settings change (PSC) event
>> even when the input configuration has not changed. The client then
>> receives a redundant resolution change notification on every seek. A seek
>> hang was observed when redundant PSC events were generated for the same
>> configuration.
> Its not clear reading the git log here where that hang occurs. Userspace,
> kernel, firmware ? I think you should specify that.

Ack, the hang is in userspace. Will update the commit description.

> ---
> bod
>
>
