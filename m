Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192682;
	b=Yndo1WXsk0klUb1ML/VtmppVelA9VRLxJMNCz/SXdJkNQnCyiaAugWYL8jQ9epmcPgHa
	 5NSqqzfp07nBHpeOoDLNgcpT8vkELlUc15SmALenBKDQFm47neBai0SfDsjHHpqRpODXQ
	 I71VkD+d151w0uZEBPiV+/Pz3g5LGDN/PdF5+0/LYVj36FYpFQmHj5kmBP86C6wNJQqZR
	 M+dN3uLFvVONcqEbATZkDP1wg8dbhAlNWr43KyZKu1GKjjLPOnIQQ9dfybthsDiNPhP73
	 cifW+xpTsX3d9zS2m6GxZ/LTqPJrzVVK+8/lFNOIZ+V1a2Ru4mw2UFsEZ8MnWb6aAow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZDpYwW1DYGsVFWX+47qcqYA+wzSCLFnlOQLlV1DniZo=;
	b=exVKyVdBKJAWMb0n1WdZSmnmgLzHIEaM7lm0Ux7batD7sFDyzsobFx0ECPs3b1XEb29d
	 gO4aK9oCUPMLfFpSYMkhF0DK+T8kEF4XjXEyKno7I3wj8pJpCrEpslmmauAzx0m5BGbKW
	 X5fGwQgKuYzKOm5HR2M4bYDqcujDWycZLqjBazAjTpb3JI0J7gjotaBVEGscfVEAfAku1
	 IKJ/ikcOQ+fizGkW++L+M7V6SqgTfr1BxKkcrRvZ9L3MdR/Q6gWTg1SUH3KfchORx/f1C
	 BrhJhED+5Dq1wwUyKvQBOk8NewlZYEgbwGeGuQGiFd3cMBLBrSm3s7C+0IfrTkmj1JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cbQYfoMD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gS1FBB2c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C96606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 16:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1C96606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cbQYfoMD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gS1FBB2c
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfMFb2663239
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 16:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZDpYwW1DYGsVFWX+47qcqYA+wzSCLFnlOQLlV1DniZo=; b=cbQYfoMD+GQcpZxS
	rlIZUpYIQlvhma7yPSBFhusrwy8tDbW15fXjjcVtShKcjv08z11Myobh1Amm2iMS
	OxH9HEne4TC45tin2r5NnRXXFFtRmu5YEn5FkwlNwi/Ad3rGV6qY33TnA1wA6aca
	kUxEBmnsiwM8ngBh5Xuopo6kqMJbsVS+q5at+DkRFvzI/TuYF77Y+bzP3WaWYhh2
	q+k3Qz3Hoq91G5zRM11QpnEvZeNNwugxVJeEd7UOZl2jiOPXL5ll5xu6KOAF/9H7
	784d5VxLHEWI7pRR8MC5p76aIPEEQ01eAIkccVDIgXMkx6dpc9FsO+tHA6xFMmKo
	TAzFtA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yjvg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 16:38:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb8b260bb4so713807a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795192680; x=1795797480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDpYwW1DYGsVFWX+47qcqYA+wzSCLFnlOQLlV1DniZo=;
        b=gS1FBB2cDvh1Yk/2sH39jhNdhpb8rNUUy104jIWZLC+tPhWpH3qLyH1Yg57keUx3qh
         lyGXmayDrjxtMo6VvE4qCzglgAL5O8n+CtXeZKQ7LhomMtM3Y+3qmNsrCR2agRTstdPH
         IJDTlbOqOrtxM4cUZbEWVW1LoDGM5Y6gpooUEcIlgVwbHFK0m5MflipzGT/zxeaqQV5Z
         RVsRbA8AkodJqQqUPtI5MAMupzmplyiuUmkTRyFZ56W+wpH5sfcKSwTKLk+IwmcseVo/
         siEciLJuXgUBqMfTmSlEQbTGitGDmZSOhl/ypQyR6rvVXLgljdNKyatACiUlcDnbbvn+
         Eq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192680; x=1795797480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDpYwW1DYGsVFWX+47qcqYA+wzSCLFnlOQLlV1DniZo=;
        b=wBCxyifRlenUp6zZzjgtFmyx9m9Rzyi2GYLrbbhjUhDqk+rz33HK9H1+Oaehppj711
         6dETpgUO57aIJGW+DjB0wFAnPtwtTWpAWz7ZqO8PAzXYIuWhObRWaq6AaXE0c2bpWeaK
         7UUGmpYbcAEQndBiVkFETy+QwLeelYT+M0wCDoQBI0lQbOMzS1Mbq6TtCHhKpEYEc/Sq
         Ty7Hardytfl+oV8DX4rQlUBUg1naSQSbBzi6xmaaTadymfbNes3BXOq7ASwO+cgsG4Pj
         1VSFlJKlXI4xabg5u5qyqLc9xrrgkskQeZiMUKd6zHVYk1kKVUYAMIoNcAJewNd8LuBF
         6Cpg==
X-Forwarded-Encrypted: i=1; AL+hErH5v8AUfXlXzsrew79x2ry4EGt0Mjr8vaY4DEchZ0S9XVUewtZLM4cjCxpSgRzI+fmDlmATfl5BrFaMY9e6@vger.kernel.org
X-Gm-Message-State: APuU4Z+sxkGJ/bUv35mT6ie3k7zyezN0Rsv+8uN4T6qbpYEqUZX4BUYn
	/9DvX1FG2UQ88EL65C/7DX5Rm50uFDn/GIe9MJTYC8g9EoUmiBBusJSb3/RoZNYV9S/Xgh+dtnO
	L4h/xKUMJYhWmE+TqOY4UsJc7Bsi+QowrCKXrumnK1Iu0fYJjtjfHBfH9ajURcaPPEP5m
X-Gm-Gg: AZFdTZdnUFXKdGSWElJrNNjoZHOMJF3j0x2K0btb5Llp+bXdfzdxxzHmL7/OFS0I6eV
	DK/BG8lcuqFH5/X75M+z7lZg6/X+1lioQSGU2W7kYNpmvfV/uHOOpZjBzQ+Q2/2PnjUtzz7YiDG
	eWtxUnBri+DRFamR5fOHCU+q/PcEtryOnO0cBLPFKJur24oY1daLXK4Y14LVEpFGeCV+uS1c8y4
	k9bSAlQsljHGYPpjD/S2HWqLRQYiojkuR7BO0+Nm5C6f/VxD9C75jbFwFHD86p8Kp0dR+D6NZkj
	czr0H3KFLKD2+F8z5NpXRTBFqOhzlMpxK5oKd0LAPN30eUpB28ZYKJKZA/OyBT5//Kq6BoCcfbn
	OEaOcQVftiHfNuKAikp8zNc8B/KEy/RTKb7TUq0H1ek+CIl+t3LeloSzoAa2TBjzxdwBSUxcEJp
	f2QOxQxsHQEExVnTliBabPcUA=
X-Received: by 2002:a17:902:ea0c:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2f03f1cf406mr41583225ad.57.1795192679571;
        Fri, 20 Nov 2026 08:37:59 -0800 (PST)
X-Received: by 2002:a17:902:ea0c:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2f03f1cf406mr41582965ad.57.1795192679031;
        Fri, 20 Nov 2026 08:37:59 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f15663fsm16472455ad.76.2026.11.20.08.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 08:37:58 -0800 (PST)
Message-ID: <088d0be9-5d45-4454-b160-efff83e7a647@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:37:57 -0700
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
Subject: Re: [PATCH RFC v2] bus: mhi: host: pci_generic: Add MBIM-mode config
 for generic SDX65
To: Haipeng Lin <jimmie.lin@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, daleyo@gmail.com,
        Johan Hovold <johan@kernel.org>
References: <20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com>
 <84fd339d-c8b2-435d-8e3e-648fb4f889cb@oss.qualcomm.com>
 <93f7aabc-4a92-4d3c-a6af-a84b461c0e0c@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <93f7aabc-4a92-4d3c-a6af-a84b461c0e0c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b007768 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=nOnPFlOobFz2IApT-gYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NiBTYWx0ZWRfXwgRiFIIul8Kk
 nVx/Tb7ptovp2e1quYkFTifdROD49QndxCxaxZDqMYTNXaQEd2b2zg+GXpraloBBncZsK+npFnw
 nACO0ReHvN/FGzwejQwedO7+Qy9qvYi33txHxqqj8SVZekrmQaTyw3sWdxjfXe5VAmLjObTSRvC
 S4vfs7Y79O6g/fG7gM+DO0lt55rYKDoUwtFjyO7AHP3qDWxsDy0qGsx0QqvQKbjJQh9jVuSyDCy
 8X1vi6EbwwQ0ahxn6jrIhxMWtN3qy1cgzQEut2QabriIw0wF0uESZN5j+qBFXkmgx/1zxlWnGLB
 i+S/JEyYcf99pWOUZawKX9ETH6OjFjxExDOvAMIadZZeFkul8j+NFTXBFSIaGy2JluRB5xfOOhD
 ilX2QuP6VRhJ++wGqf3Yjxyepx5p0SgO57umhC1uhSJtB7A6/7D/msVY+B+BKujm3TEfs3mS6W5
 4E8Wsvy9RholHZxLmsA==
X-Proofpoint-GUID: WdZW-TZWUrvaI_3EyFLQkJPIEAJ-ypD5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NiBTYWx0ZWRfX8wPIoM1UohT0
 a2LLh6qUOg99/A1SFHtsg6/o5lx8E8PFZepjEwpn6JTsQe1/6kBLn44fRdIxZSsmSaMWgkMoDWz
 k/85w0vD+ykvL2wR+QR2IdXVQEMFUvQ=
X-Proofpoint-ORIG-GUID: WdZW-TZWUrvaI_3EyFLQkJPIEAJ-ypD5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200066

On 11/16/2026 8:08 PM, Haipeng Lin wrote:
> On 11/13/26 1:53 PM, Jeff Hugo wrote:
>> On 11/10/2026 6:06 PM, Haipeng Lin via B4 Relay wrote:
>>> From: Haipeng Lin <jimmie.lin@gmail.com>
> [...]>> Boards with a Qualcomm-ID modem in MBIM mode have so far been told
>>> apart by subsystem ID, like the SC8280XP CRD's SDX55 (17cb:010c).
>>> This modem carries the generic subsystem ID, so select an MBIM
>>> configuration by machine compatible instead.
>> I'd like it if we could query the hardware to determine if it is in this mode as maybe one of these systems has a SDX65 dongle attached where this workaround does not apply.  However, I am failing to identify such a mechanism so what you have proposed seem to be the best solution so far.
>>
>> Unless someone identifies a better idea, this seems reasonable given the situation.
>>
>> -Jeff
> 
> Hi Jeff,
> 
> Thank you for your reply. I tried to look for a hardware hint since we
> have to select the channel layout before opening a channel (so that
> can't be the way to select MBIM, I think). The oem_pk_hash on this SP11
> SDX65 is non-zero (12 words) so it could potentially tell this module
> apart from a dongle, but using it would mean reading BHI before the
> controller is registered plus adding a table of hashes in the driver.
> 
> I can try the hash route if preferred. The machine match is simpler
> although it wouldn't cover the situation e.g., a SDX65 dongle is attach-
> ed via PCIe tunneling/USB4 you mentioned...
No, I don't think that is better. The pk_hash is just what firmware 
signature the device will accept as valid, but does not directly relate 
to the capabilities of the firmware or hardware. Trying to tie this 
workaround to that feels like an abuse of the meaning of that register, 
which I would be concerned would lead to some horribly broken corner case.

Without additional data, I think you move forward with what you have but 
it is really up to Mani if he'd accept this or would like something 
different.

-Jeff
