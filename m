Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657074;
	b=3wBqgRDhQLrXSoyKhPMAXCDxUDq6ywneMRKMHML4aLwXmklqONUc6rjmjTNkIQvltoUl
	 Qf2B3gkz4Yg0F5hbNwjVa2SiWLtw+KR3M2vxTvbmtZp/bOPPWKve107EAp997E9R/YOtU
	 6/1eDt11WIGV96TsWr3QHAKPteYntFApJx+ev4lHPhU0Tz/6WMOxh5JhJDOQSqb5eO0k8
	 edYPXXH9ObaBHw226PfcHmyCl7flHPCcTIYxpnAOIymL4TL+aVM5KWTTRmA1tpexVxbx1
	 r5MT/IfQN4/qecEIT5j9JjdDtBmbF97R8OTqIfUtxZayvNneKhXVjzYDz5K0SRZ6h5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hnnfiqH5lmLTYq6GNfTSxZmNm/Sii9UXewZ6H0DCZGE=;
	b=iNWBSHf7NLGyBQLnXavRBMlywz4AexTOWXReSX+P+6KMw45SOhNgHYRxHmtgZ+PdzdVM
	 FdbmwwcQUkKF8lQ4j88pCK1TTDb4f04IXD3WTIAcjXQpsRCi/dAaTvDCbVGU9qmQ8pBuT
	 x2yjLPWPDZFkLqK59+vVF/ZLKqb1m0mx3ubLWfG9uKEzXWZ9dcP1t+L43NVEvOhaEPUFM
	 dDGGovDnduQibtIkdGimHrkiyEiGxm2JhGkF3JSaEkc9Bnvs/HA5zUa9qHjFr9hHhkvVx
	 J/ZjBOuNYu8m1i6iU8JWlcdH5CoqhwdjPfD6iMc7THBor5+bkTzm5batHNFMnzrWzAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RlIkfXMw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q+VYID3z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DD9606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DD9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RlIkfXMw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q+VYID3z
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70ETo2516156
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnnfiqH5lmLTYq6GNfTSxZmNm/Sii9UXewZ6H0DCZGE=; b=RlIkfXMwB0zr+QTS
	SO2/LOChuTA60r4lBzCleqghy6GVLbhVxGzD2/JlzWax7B2ZC31f4y2tkA9ylOey
	UqPCbQFxoVQnlv5+be0JMQr72qOiiHE1oZlJJ5MFKhDHbmNGVWwQBy7mzapfb2Xi
	wHUwOUjSoK0GFi2Gwq1K/VQUyssZNAERlict5Ws/0P+ii/DTyF7IG/tYqD2Q7DJY
	83mv0vyCG4Wa/HXU5P5+kwIm8zIacTQFZaf719gUY+eOr/jJ6FaMAkIY8NR02tYL
	AYK0N41KMh5Z2XiWpkl7Do7G7L2DdzLK4EYQ4RnSeqnOnGRpvTZS6sugCgLStVGQ
	YQsaEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9e9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:17:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d02df2bf09so11869825ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792657072; x=1793261872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnnfiqH5lmLTYq6GNfTSxZmNm/Sii9UXewZ6H0DCZGE=;
        b=Q+VYID3zt0Zsnsi46kS47NwfSpPZcSWOrg4GroyhW2poGd5MdkAK6VZzNs5QGFZ2jG
         JPO+KGTaLLX+9Y3lE1ETwFy3vQu9iZFEyLjml6dGB/uIbxnZd1I7qJFZ2sEGi8JORN2m
         B4EzqNXt9AYuTHlpzFdvzFvUbfB8R5HgP3Ubm+VWvs87YKNsErbyoFKb2lwfGyMC9PBr
         AgIyOM2tnjgCwK4jn7Xm8b2cx+8OKVTHZWpkeGhVHpZNeAzShgXB3i1kSowpc2TzXtmU
         an2vLONNgrTkwwCHxvP02JyNG9cgz40hXvUZUjLmNcrZ5H3vN6oq45RjCdDmF7BWD6+g
         FksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657072; x=1793261872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnnfiqH5lmLTYq6GNfTSxZmNm/Sii9UXewZ6H0DCZGE=;
        b=TBy4SOuwzUEOm5nGbCxiRvRXElJlFEx0zdPZtM4ih/ecU2s/geUOUQdHIATBFoRCbe
         Y3APtcH16xRnCQ1yuGPC7KZG3H6Ddk9ubASaUwqnSXh2IQQKkg9R3HRr9NrplSxUHgND
         CEVW57YM9d56QKi47zhvV5ODH0HZYLJAzXiqeDf95X1kJtJR5M7T8Ps2uePgsmExBhN6
         vvEmkwqoljdkJ+bEu/9BNh0dDgwOc59FtOXt3DIOFcIublzbZwQpA5SVrw1aRIzdPGuY
         8JUwZnlXHXqTss9dJoD17GuVEUuZeZzE6WQSB/Ps9iIZob5OQSXqUYCof9MmOkArzIzn
         7wLg==
X-Forwarded-Encrypted: i=1; AKwUvBzWyan/1xI/iBE8nIAku/zulLsZCxXXrBr2KlIZh0gG7QazC/WRezhiv+qHxhASRWEXyY1FK8FqjMElxK5c@vger.kernel.org
X-Gm-Message-State: AFq9FYLLX5ADgjZrcVm4DAq2SwlDRx7GjNq8cd9AYGWfNoipc4oIk99J
	s1yV8gkNZw7RVqA13pJH7vBnocUPzemvOqJRjeHie5WoOMr27htAI3bsDUqiD+nEa1Ot6fE5cjv
	O19VNtVvXGEWP25ooOPIYeGYixYluxriPySdLdVL4AdVQKkI9pWr0I4zZRmWKk7g+UwwB
X-Gm-Gg: AYBFou1xsv6Enln6N7gu2K8hhGsboDvVv6o73jueJHo0V+SrSXnGfpWX3gIylMCQN9d
	edBxHGQnGlf56GMeKrVQgnAY3ilQ7MaXiAqvCfdOR7vTa2NKjcQUHRqxJbAH2anpRjabXKpl6/o
	EO49TqZv+Uh88vlf5xi6PiWfB2hYhZQkQxEqx7VlvzVVcmafpqUavd/qjayCEPV7hboWPSTTkkk
	5cs0hDz2C+6XRFBUkkzZMWp27fITthcUq3Geet9W650nI5MLcCPxwRIl7/6+thJi0CsspqPBz6v
	uoOFnaotiUJdRDZiIc+qkIyAxxlcUIZ4RwVNZY3cmgVrbqytnkj3euTXbDNOkymc6Uz8H4UwS2m
	F0qSB3uQDqP1yqK1vvjHoGH+D
X-Received: by 2002:a17:902:e74c:b0:2dd:c0ff:e72b with SMTP id d9443c01a7336-2ea4404e987mr31301375ad.61.1792657072142;
        Thu, 22 Oct 2026 01:17:52 -0700 (PDT)
X-Received: by 2002:a17:902:e74c:b0:2dd:c0ff:e72b with SMTP id d9443c01a7336-2ea4404e987mr31301235ad.61.1792657071603;
        Thu, 22 Oct 2026 01:17:51 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.228.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b307c38sm20847025ad.6.2026.10.22.01.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:17:49 -0700 (PDT)
Message-ID: <4e031de2-6564-4e63-9102-799a0b435689@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 13:47:46 +0530
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
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and
 questions
To: Jeff Roach <jeff.roach0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
References: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9c6b0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ipsIN8yD8anPosRfiFfp5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oLZ9H6WYk5nwdMUEBMcA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: TWxn-NPw1hB-qFm7UYVN64fABsH-t_LB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX601umX+Y6TVl
 QFssj1mPydkGbB6eUmtasdTblPXpV3ElX+/kRuAP4c8DIxeN678JFWVl78owZNhbJxqn8P2FTx3
 cjO5vm0t0TwAqX+WLKCRnhgfWsqDR30=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX9uVptWPKdON6
 YJTRPpSxwKe9b7EnwEYrYscaumKyWXfBpAw5W6AQOx8PwlokLUlUIVyFEez/Y+wjC3Ivu90omvv
 jVKHtsgSbZcjh3aMU5mYCR2oTqzn6xuRgOzE0M5Hgb3VOJM9gW7JPSr2lwJwFsNIoVdwzGcP5hq
 Bghf2T9aJvINBq9J8Jns46EdUl5pE/X3Twahh+NdpCdXybRFETrpeHhtXVi7gw52+y46zqohg98
 ZHcyjpRXpI7B0VgIFoSbILe3YIU4060+BPM7WPxFOg3Ajwq13cu/fIacgRrJwueC+cZzUaCYGTH
 kCkKdAW1u/YRRN3BXXa81hcfGPTyJO6QhRcJ2N9Ef2iunrpwH1XOC7C5x5eP7/SNgsKE89RAQEy
 pIN3l7gqKHstc6d09HYJRSC/MGdPI1QUceV+T1JHTf4JxcfVn+I37ZHxdIZ2gqgoYeV6DvQszqV
 feuJAi781NLsgD1b4CA==
X-Proofpoint-GUID: TWxn-NPw1hB-qFm7UYVN64fABsH-t_LB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220032



On 10/22/2026 4:04 AM, Jeff Roach wrote:
> Hi all,
> 
> I have a device tree for the HP OmniBook X Laptop 16-cp1xxx (board
> 8F46, Snapdragon X2 Elite 12-core, "qcom,mahua") that boots and runs a
> full desktop. This is a bring-up report, not a patch: the DTS is
> currently based on the Ubuntu linux-qcom-x1e 7.3 tree and still
> carries my verification notes. I'd like to rebase it and send it
> properly, and would welcome advice before I do.
> 
> The DTS sits on mahua.dtsi, uses the same PMIC deletions as
> mahua-crd.dts, and copies board wiring from
> glymur-hp-elitebook-x-g2q.dts. I checked it against this laptop's ACPI
> tables where I could. DTS, notes and test results:
> 
>   https://github.com/jeffroach0/omnibook-x16-linux
> 
> Disclosure: I'm not a kernel developer. Most of the analysis and the
> DTS were done with an AI coding assistant (Claude); I did the testing
> on the hardware and checked the results. I'll do my best to answer
> questions and test things, but please be patient with me.

Nice. Maybe AI's killer feature will be making DT painless enough that
anyone can add new device support. ;)

> 
> Working (kernel 7.3.0-21-qcom-x1e, Mesa 26.2.4):
> - eDP OLED panel via msm (samsung,atna33xc20), DP-AUX backlight
> - GPU (Adreno X2-85), with the workaround in (1) below
> - Keyboard and touchpad (i2c-hid), lid, power key
> - NVMe on pcie5; Wi-Fi QCC2072 on pcie4 (ath12k, modelled as a
>   pcie-m2-e-connector)
> - Bluetooth QCC2072 on uart14, using the posted QCC2072 UART series
>   (btqca/hci_qca and pwrseq-pcie-m2 patches) built out of tree
> - usb_0/usb_1 Type-C (SuperSpeed in both orientations, PD charging
>   through pmic-glink), usb_2 USB-A (no repeater node needed, UEFI leaves
>   it set up), usb_hs (webcam)
> - ADSP/CDSP with OEM firmware from the Windows install; battery through
>   qcom_battmgr
> - 2x WSA884x speakers on swr0 plus VA DMICs
> - s2idle suspend
> 
> Issues and questions:
> 
> 1. GPU GMEM size on 3-slice Mahua. MSM_PARAM_GMEM_SIZE reports the
>    catalog's full (4-slice) GMEM, so Mesa's tiled rendering corrupts
>    the screen (garbage bands, diagonal half-drawn quads, and CCU write
>    translation faults from WebKit's Skia GPU raster). FD_MESA_DEBUG=sysmem
>    and TU_DEBUG=sysmem make it clean. I think the a8xx slice-info change
>    in linux-next ("report the active share" of GMEM) fixes this. Is it
>    going to be backported to stable?

https://lore.kernel.org/lkml/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/

Please check this series for Mahua support, especially the DT patch.

-Akhil.

> 
> 2. CPU frequency. scmi_cpufreq fails: "timed out in resp" and "Failed
>    to query supported version for protocol 0x13", probe -110. The SCMI
>    base protocol answers at boot ("Qualcomm:PDP0"). The perf
>    protocol never does. The clocks stay where UEFI left them (about 3.5
>    and 3.9 GHz). Is perf over SCMI expected to work on Mahua with
>    production firmware, or is something else needed?
> 
> 3. Suspend. PSCI SYSTEM_SUSPEND (deep) returns -EOPNOTSUPP, so s2idle
>    only. On resume from s2idle, usb_hs (a200000) gets an arm-smmu context
>    fault for SID 0xce0, then "xHCI host not responding ... HC died", and
>    every later suspend fails until reboot. Unbinding dwc3-qcom before
>    suspend and rebinding it after works around it. pcie4 also logs
>    "Timeout waiting for L2 entry! LTSSM 0x11" on suspend, but the link
>    recovers.
> 
> 4. Smaller things:
>    - "GICv3: SPI 4115 out of range (use ESPI?)" right after the SPMI
>      arbiter probes. I haven't tracked down which node causes it.
>    - The pm8xxx RTC probe fails with -ENOENT because this machine has no
>      RTCInfo UEFI variable (qcom,uefi-rtc-info).
>    - The headphone jack is a Qualcomm SoundWire SDCA codec (only in ACPI,
>      \_SB.ADSP.ADCM). I didn't try it.
> 
> For an upstream submission I assume the right base is the qcom
> for-next tree, with a dt-bindings patch for "hp,omnibook-x16". Please
> tell me if anything in the approach above (for example the /chosen
> simple-framebuffer that keeps MMCX/MXC on before msm probes, or
> dropping usb-role-switch while running host-only) shouldn't go
> upstream as it is.
> 
> I'm happy to test patches and other things mentioned in this post on
> this machine to the best of my and Claude's ability (mine being fairly
> meager).
> 
> Thanks,
> Jeff

