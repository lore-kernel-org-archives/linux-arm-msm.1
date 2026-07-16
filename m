Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55593F58F5
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194530; cv=none; b=AkMFPM6T85e+eOlxiaJvSasE7WaBrGFy+y5rJ/CT1Rna4PNrXZuckgKILzLZTs7vdgVpReUdk086ZYGqtapnL3ViXHJTIglTUWJl+1ZwiQjaug1te86hHb+dlt4MdUo9UgQxqrH65nfdWuNtTAJb0bWoKXBhzh+V73hk7HBaokI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194530; c=relaxed/simple;
	bh=ADeT7E9Bz9K99ng3EyTrOZwI9ocSHrQxgOqzEnTMxsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHbhFd9Zgg5f+UKOcYv9hm9m2GrR9YyTuhTpS3qN5oyso3cIEyHdIo/pe6e49pZ5UVSQmXh22XeDu7kFeAucYQ9GjUywbpWAP6wIKGhBDU2FTnxhRjR+VNCF88L14eWcwaHKv2r5I1yFik+sQKUW8UVvhOd9xQHXll58jLRFZHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4qJmcDt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3Qe5qTo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4qJmcDt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3Qe5qTo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7XO7L2176004
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wtiV67LAUiYJrrpShupYcKLSCS+HBgFa3fDdCSNz2y8=; b=i4qJmcDtLymH2qwE
	Tnfg0SLb0yLJMlrlqpCDETsXMdWUcdW4llYek4rG3Sy35dI8FEFkwxX9X74TFd66
	t2Gk9SjwH/OmWNDkcK6NqwaflGVE9xWtihAOPoZfRhYp8zY4ZqUKWKm5o0pZrDLK
	U75+I4z/K0hQs9vsMLLR6Lbor8Ugohq/QTmacT5fN5EY454LVfT6O00x6hhDvumY
	0DfT/7/M6YiWL+uMNKCihdhHxk6myWKPVP1gawQ21fSSKmgwHAeTMYaLzcTGCDRo
	0Rn0IMkrMkLvZLE0JugRasPrrgeJXCCkSjyLsnvEQU6EWCQeYo+cy+uQQ1H9FBmk
	M5dGxQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feu108en8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:35:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ef7c6e9b4so91670785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 02:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784194527; x=1784799327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtiV67LAUiYJrrpShupYcKLSCS+HBgFa3fDdCSNz2y8=;
        b=B3Qe5qTo5sA0zObIbJfS0cs+Bszmj2L+6uDQZ5j9uzF+PDXFjuRi2a8bS2JKhsA+ei
         ykauvghBvnNs+mqKAXbutCGNgeXx14sBilYHrvnZlgXBiU37GqP1yjjar+d7+1ySiRc4
         H1HbNM3YFQZEf+/XOadHM87IG80qmNioVcorL024KGGeMKz1X/7mo0yr0P3J6fjKkL8u
         BfQPufrsmdYYBC4O8K+WBgIOQ6pFswtFL1ggdgv1m4fWHPp47qjbXdf8waXjxvjNtCFO
         NBoC68sSiy+rBZ+AHOqMgka0yixYQnOVAWEXhZm6aI0P5qNNpz3I0oJ7dFHjRecPB43i
         QBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194527; x=1784799327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtiV67LAUiYJrrpShupYcKLSCS+HBgFa3fDdCSNz2y8=;
        b=q1ZKcTPB0VMunXg6ZFzPpEix3QHP+J2ECO4f5qk4Wgv1rvdIMNRYOPH1brNwc6KvS5
         DmTiGYF7QwMDmNgtTQJF+4a8lLbS+RLJNTNef4XoERz+pUGC7fkfGMTXNiPlFaAWqgPp
         d14s+/7FP2FbCORouVSNYhFuKOfCwK2PpD6BGL+R9HgL/pQe+2V2Z5MSH0NsV40AKqh+
         bJf2PBusGBUgTL9hs6RpYZk9o5kyIut8x2ptdH9GxlTIYWPXdYNljSQHBVF6O54QY5ni
         gbGl9luDcwW8N1XaIeVl9NU7IFMAUKBuE6qhjfxJ2U78VR4N+16AJL2ieWgvN402xUnP
         BgjA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4Nq2iL5L8GZlkXMhBPd81iEq1E/mUTxTE4tJfo3Wt2JEgr5GpSJFANFO3dOQXhl4105NBllddkSdgqboT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp66lNtc0j4iGvXc0DWjWfP7cnN9YTOgNfaCmrNjjgxZgGWLz1
	/Xujxt5AhG4EEPlDfcYAQpaKl+rjjd+eeLhjxf3AACiVoptMCAYnalu3IclBTWPzPDMY7hxaFMw
	8aA6rnJzCktJH1xx/5CfDWyO3cg47AKaKb8XUvH9LEKluNx2gN+M1cyFV6onFjIQLohxj
X-Gm-Gg: AfdE7cn8pwERu0/IdKkFCbZwvCyIFlY/WL5ZAjRlx9bjkgmWbx9fEIR/8rg0dfKPsK3
	UeEpKJVpNNUaPCFr1wjTPXbtIxe5AAxEUEXUTrUjU1IczTz4nElZuu+fl1fJIfHXG3H9T2WUaG1
	IK6P9sdzV15UigrsQMk/Hh0HPyFpk92HPm/N9bo0wYUyZV4h2IzLCe7yyVVbr2pkY0wgOZXFS0U
	LkVZp+vciAhjYJvP31agn8iaHEIbRTsvpUxzpcNoZKOpqakG93XvBGsDHIwfsS9nc2ck3k5S3fW
	/nOBvYC+3wu9AbWGbP7akua/YgD6ugQG+29plPa9xpkgfrrMx4JavfhQUS+CB927TRlpC58n+nf
	5qNOfzDzGksYT8oTOSnOEhMEg
X-Received: by 2002:a05:620a:440e:b0:926:e8e6:3c28 with SMTP id af79cd13be357-92ef2cb409bmr1576834285a.7.1784194527113;
        Thu, 16 Jul 2026 02:35:27 -0700 (PDT)
X-Received: by 2002:a05:620a:440e:b0:926:e8e6:3c28 with SMTP id af79cd13be357-92ef2cb409bmr1576832585a.7.1784194526621;
        Thu, 16 Jul 2026 02:35:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd289ee36sm4267635a12.11.2026.07.16.02.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 02:35:25 -0700 (PDT)
Message-ID: <7414f49f-b05f-4c6a-b416-a9c2004f5d98@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:35:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] Bluetooth: qca: add QCC2072 support
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, rahul.samana@oss.qualcomm.com,
        harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529175822.3366535-1-yepuri.siddu@oss.qualcomm.com>
 <CAMRc=MeUhtNiMQLeMwvF_v+WOaiVgF+jsTM1HPZd_XdkGk3txA@mail.gmail.com>
 <ca635179-eb3c-4a5f-882c-065deaca155c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ca635179-eb3c-4a5f-882c-065deaca155c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1R31lZz-ooQt5tVc9LV_mIihC33J9jGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5OCBTYWx0ZWRfX5Co4GCxK0Pr9
 XW8y2WzgIxwmeHFKGNyNjqYvkEyzSVg2Sx4oyw4wSP4uqcSrKVaWoBgyVTmY150+9OI4tgEW/ti
 IzK4hjcMXKdrULNTdsEO1O3iREhgFVevb0idW3Zulp9xtBQuZ2u8e+GXrdxVyaXl7MXcaq1WDxa
 dEflBSvXjXrZCPUF+GPK/P+Zl0ULEtbe/DKOEpL6787LGH2pKsSFztBCCxC6XN5C19zFJMWJfbF
 lSRFp/sS6b8U3HZ9lsMK8Gf5UpS+1S7q6/uz9RRCCQaQeWdTQP3OmlaUDntnU+g3MvZUu6JGcLN
 Xrbom7OLH4e2L2vbsDflRPhHTx0DTtUpZ3d51GQxaI4Ye11TIyb4ju1CE97XI7WxWV/ME2MjJlu
 8rds0XDiCoHHCZE/YM2b+hNIMwkWdB7imCDw3RGsBhxQjh1URpMyVhks/9RSXuja7Yy/OMq+jtW
 7Dei3uFsiBZvoJ1d3aw==
X-Proofpoint-GUID: 1R31lZz-ooQt5tVc9LV_mIihC33J9jGz
X-Authority-Analysis: v=2.4 cv=BPODalQG c=1 sm=1 tr=0 ts=6a58a5df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pFu8JBWaasDEDLfnACcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5OCBTYWx0ZWRfX/eTu7r0WKDEo
 zOCCQfqKJIeajPscjyWf2EAUSA5WQGWXczMzybXW0XUf1eAYBRIoSqeK/aMrZgNwpc7GyssGU+3
 LiWk+UHsu+KViY8yFuPwOG6rq2TCuw8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160098

On 7/2/26 12:11 PM, Yepuri Siddu wrote:
> 
> 
> On 6/1/2026 1:57 PM, Bartosz Golaszewski wrote:
>> On Fri, 29 May 2026 19:58:22 +0200, Yepuri Siddu
>> <yepuri.siddu@oss.qualcomm.com> said:
>>> QCC2072 is a BT/WiFi combo SoC that uses different firmware
>>> filenames and requires no external voltage regulators, so add
>>> it as a new SoC type.
>>>
>>> The chip supports the wideband speech and valid LE states
>>> capabilities. Its firmware is named using the "orn" prefix and
>>> follows the standard rom-version-based scheme:
>>>      - qca/ornbtfw<ver>.tlv
>>>      - qca/ornnv<ver>.bin
>>>
>>> These firmware files are already present in the linux-firmware
>>> repository.
>>>
>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>> ---

[...]

>> Looking at the bindings: this chip cannot have an enable GPIO, so it probably
>> should have its own if branch that unconditionally sets power_ctrl_enabled to
>> false?
> 
> QCC2072 is an M.2 E-key chip. As M.2 Power Sequencing changes are being upstreamed, we will reupdate our existing patches to align with M.2 power sequencing approach.
> This includes aligning the bindings, DT and also BT driver changes.

FWIW with the M.2 patches applied, I can confirm this patch works
as-is (modulo merge conflict) for me, please resubmit soon.

Konrad
