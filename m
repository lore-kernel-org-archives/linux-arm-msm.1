Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE0401494
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583917; cv=none; b=lDBlJpo9DpkshikxqpVUyNHHdvfLCNonLJI2ByHF41uKgi6ev0X8a4B2kESPBVmmjfFjQ/lzhxuksgneQ7uLM+pyrolBBsOtmKk9ZyGrtXM+hwKJd/OEHtETmk5rvfg60jT1LfN+yBfDHsCfmAje+xpUnZtRi7YB+qdAhuw2WY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583917; c=relaxed/simple;
	bh=sMTiCyj5+9y1S8LPjELQzmaV6VdDm+PrnVA/OmtExmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aIXe8kHsp5mjhSkJQmz4DIX0rttRnYsO6prQtBGauFw2y3R+RvtSp5/6AdyzhWbjwDQbg+q/fkf0U7kVKd3AIBZ/xPv9vjSFCOD/7IIIVk8Zg9laGYUXU17k8DvSD3NXNDTVXXVOdevCNyHhhtt3enlJ2t/0Kyv2XV05z+tcG90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQo5YLjb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+jSYmO1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQo5YLjb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+jSYmO1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv35M2950661
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fl6brSJe0+fFv2NIJ5+xIBCq87sP/RzIUmJGMjRks6w=; b=WQo5YLjbSEP3ewIO
	FMnI97R9N6YJk9la5QGqIYT9UtMW9cG3IztThXugYL8syL/mcdWFi3KFxSgCdjaF
	NkLRTtHpkTxdPxOVsJ6wRh5KWnwmV8Q6tYx9g7hU9iun2AHu9FUuupGaxrAofXXD
	/GF/hUsroSWgFe52OL4A3mT1UaQBcXzXWZxSNqkhyeWWVs7uPu7xcEcl1LB8fmc3
	4aiQt2ecuNu7nv0L8n+kJeQy9fyY6CtXUbB90tBVyXtBFiVvCaaMguqrYa1tZWHj
	EQ7BwG5HtkJkWBkauqMQhxQWuQQ64OzDKqN/1j4IC0f8XWyHBhC2WhixoOCUVi28
	DS81vA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r1rkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:05:13 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97c3746cd0bso52630241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787583913; x=1788188713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fl6brSJe0+fFv2NIJ5+xIBCq87sP/RzIUmJGMjRks6w=;
        b=d+jSYmO1wezTJuLbkLV5k/f0PmfcOJkzDNblGiRBnR3sdukkgqH5aiBT9zF19PHMa5
         iQfsjPqnZm4bZb8hWxGNIVlMpkPnDBMcDopD3IW6+XrV61eW46H0Xrv4KOex2PbZEQuv
         tGAxNspgNJGaWE2hTXJY9eTeBnyxEVgOry5BpxBrua7t5rwCg/yag7SbeBJ4kXlmvPz1
         6I+gsY8WplClverml168O2xAXXe2n6GRrDbwxyRI87icpQrDWWY3BEqeuDRaWCEvJcbR
         AOMEb7i39Qid97j/1m4gT8J97BO/iOejDpEe0DdLAjAvqwaKIcJxnOo7ThyZgVaepnTi
         2cNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583913; x=1788188713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fl6brSJe0+fFv2NIJ5+xIBCq87sP/RzIUmJGMjRks6w=;
        b=YH7Ht3JNZrzUYlyKhYOuNj5dtuFmI/ia/8KRNISGNb5eXbVvV7+YanOZ8r6CtHbh/u
         Q9f8sBDiEI2lUKFzKY1EBKcbxhLAnHpJ6QfJSNXZD9j1Bjr+0y/hYRiGELprsD3CT6Ug
         WshzTDMTdmDIZEvYE4ZWMz3zhNYDq13ntEchQDOZAtZhiaDbMPjVZvKH0w7WqjaBgK4c
         HqwpN+nVAWGDN0XkVIhVPz/RZJ9ZVmUwOc5kuicWNRvy+v+hbWv4Tvj07nMG2S8Lw23m
         XMsOmA79+k36YHZPtbEY36E55OUIzLbPOiiTn61t/F9qXJhhuj43/TufefRAFNRDgMd4
         bP5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrSNnHvQMxS0corwOJCo9v4UhHUTKr32d7ZhHfkUg3ko8QVewW4EnkatObxsJK+1g/trmmk24ztnKsbCq3W@vger.kernel.org
X-Gm-Message-State: AFuF++msLbEfDCqrmb8v1bCX2slCLE8mfH1OIf/BtHkDWJ20FvFT4nf7
	vARKVF59sMhXNOoqIiPeOb9nazk9kG8GIayBkpYfJklrsddRn0TcaqnHk7ITBDc8KdGEI6NShss
	7evw/ckBrWF1TqEdC8ZJE+nsV1rnwX24rNcwWwqQUgP5K1n4wavw6ZxF79YiGdj4RsIGw
X-Gm-Gg: AR+sD11xWaU/Hbw7z8cmvfIGr/+e8iPtNpjoh05pU3tmgbKOIpWnEdKpGLDd5r+zzMd
	Ba2u52OQC/uIglW7fDl2fgO14VLkWRmfS3OrVKTH5xgUvEdzrhWPUhY/qsmqFSqEkqUA6wt9jVj
	LIYQVZ9qn0CJlekzK4gzS2u0787/b6/Iovjxx0IX/5bS+XZWvrTVS0+GxV9YNkt7VnOyDsh7nAF
	VibIgLymyfovWcUqMswk2HIer1NX/Ugpb7DnkXEjgS/EOvlUap8XvI+MXEWBp0oP8tybN6KmvHM
	WGBQ2NfjlmNOhb4NpN4VuxnM7YmU2aptO+d7N1digp/1PLDMJrWSXW2wuOObjQiaWTEwOdGVo8B
	TajE+JLhlMw==
X-Received: by 2002:a05:6122:849:b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c5ff3f5682mr2692086e0c.1.1787583913306;
        Mon, 24 Aug 2026 08:05:13 -0700 (PDT)
X-Received: by 2002:a05:6122:849:b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c5ff3f5682mr2692045e0c.1.1787583912801;
        Mon, 24 Aug 2026 08:05:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab3csm1349197666b.49.2026.08.24.08.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:05:12 -0700 (PDT)
Message-ID: <4e0d636a-7975-4711-8070-6f71957b754e@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 17:05:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] serial: qcom-geni: Use geni_se_set_rate() for source
 clock configuration
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyNiBTYWx0ZWRfX5vvWYSaos7OQ
 5Y/3wGAkl/fGxFYWcCAS4dxSd1o/CSKR6vjWYmbeVWRvvHoadRy6osOJbwwa0vd06Rfc9oG+Ry6
 1M9GJjCzigr3cogMV82BSV3P+sYRkZWBPeMCqOJO9qlI0k2UTHX0Vk0FKNgkIvouES1s7ZOxCoe
 V7l09mExUIE96i4c4n+2ZH3cF3A+VXrOFX7KDhQC+TlBDE0+UVYY0ph3YKueUyR/LDAazd24Jbr
 i2ZYf75D4aet2zx+sSshUNnP3dJCWZwunD0c+OT+g+Nj8/0LQhetVgtHEt/iAvXqwdSHSLL/Lkt
 tDAutHkFR4D/qf6SS93s95AfoYC93x48toVD4b6KRTWtL8LEWwhdX6EvBz7i0rFbmUGoEKOnk2a
 EX2N4SXvbqOYsj4yand4HK4TaVIEXskEetv+r3tb9qtLd4FmfrYqO4rV4221YpZCYfqLa8xb4GM
 OjS4zyOBTA9DTuvtNjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyNiBTYWx0ZWRfX8r6KOEzhT55L
 Wase5mX5H8A2R3SRdMpZQ7RJq+ELUA8i7jCb/DrnGTevTZaCdKLKFwQwZu0ngq7Zb56gAkC5BSA
 LJVL/skU39PHml9Hjea7fy4RG8vgqdY=
X-Proofpoint-GUID: R1gHR9JANa51GuuECSxugGpqQObWsGvu
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c5daa cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=LofuKaiTYX8IWbRp0b0A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: R1gHR9JANa51GuuECSxugGpqQObWsGvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240126

On 8/4/26 9:57 PM, Praveen Talari wrote:
> The driver calls dev_pm_opp_set_rate() directly on uport->dev to apply
> the computed source clock frequency, and dispatches baud rate handling
> through a per-variant dev_data->set_rate() callback that either
> recalculates the clock divider (Linux clock managed path) or selects
> a performance level via geni_se_set_perf_level() (SA8255P firmware
> managed path).

[...]

> +	geni_se_set_rate(&port->se, 0);

This ends up calling dev_pm_opp_set_rate(0) [i see this is an existing
bug in geni_se_resources_deactivate()], which removes the power vote,
but does nothing to the clock (neither set_rate nor disable_unprepare),
which will crash the platform

Both of these calls (new and existing) should be removed. Clocks will
be disabled by geni_se_clks_off() in geni_se_resources_deactivate().

Then, we should do dev_pm_set_opp(se->dev, NULL) *after* they are off
to remove any trailing OPP resources (i.e. icc votes defined in the OPP
table in our case)

Konrad
