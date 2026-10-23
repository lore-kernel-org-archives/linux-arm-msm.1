Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741861;
	b=ZenpzuhoE0V2f86nSTBlEZ2Sf7Ob7FfyhAWcuKoJFSvAv7BfhqiDuF/JC5izrKup7F1v
	 Wvz00mLu0ou/NtlSERdMPoEzIld3v6Cb/RkuI1pAxuvE7KnhpebfdrFzSyflZno5GeeiO
	 idmOuGpUf+Wf5KUJk165zlemMB6P8QFnzbLaW4G+NRaMo8nee9JvgMv1GCBQuV7ToPyxC
	 0EK6O6S4TEhoSDfIkP0in/oz9y/4K5y72dsmZAJBZRQlLNXpX8pMx1U0JucMqiDjhxjRg
	 PxQCtcDPsMpMd9nhV3CLPegh0t72/o3GXScApw6U6V9fVlrMrzngv3NOSyMAJBWUNcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741861;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8kgvdSi7p94DLvTPbx85amBtEZGGbeahNZvNIQum090=;
	b=K6m9/QJgvn4F3N2dkfBgi1JYbKzrter1VHflqvPEClmpelfo00sGzHms10CoQev06Mfa
	 0Bqg4m2HFBWU1DuWf+e3U6+TsxCxClLQBM0FBUI3OaszG1M5wjoEeP+ZqJRh1qyFaFEv/
	 GGJVe5RNL12uHN7gVmFfx5g77yYbXe3pP3XsTbbrSNjBZ0b2JGqGI5mQkvkoNbwOg7zkZ
	 QiQTyM/8asOABlPZAIA+vIFK+tPAO/tmUWJpU/XJkVZkRL5CW20GFu6pDLsjIehYmU9iV
	 2lzqVGVOvCYsSdYMhcUI63BUNOG//LyIk9uURmSA8QR6J6Qa68oqz9Wpy/ddyWOa6tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HAq5P9yW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="C/SU4Uba";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A432606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A432606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HAq5P9yW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C/SU4Uba
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FBxQ2092816
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8kgvdSi7p94DLvTPbx85amBtEZGGbeahNZvNIQum090=; b=HAq5P9yWvpQCbwPK
	vSWD8pR6q4k4iv73whUSnRD6y6x4VMzUmY3GFO01vkJGRPb992U26AEiJ/Wvt3Vc
	x3n/OvGwyP4pe6wh69gHa30P86Ao871hqAS57fp8uEffZbvRUzP8+XSHYvIIbl+U
	rULStjeIKQuuNn8HCLsPiuy+DLTihRSGQRrJdOUXgA1glgcmajn/NdQ+woLuhD5n
	6DUqA8RDsNhIjDBkvFM7Oz7akQaZv9xTnW16P5N/KZSYsLEKmykWuPwRdi4ee/Xo
	iXi4QiDZdGmr1DwaMeh5cGTQn24uqbhn8nLi8VnLeS1N3il0Z0VXuh1Z5Q9CcdkI
	AnjYNA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftyg9sfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:50:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so16469685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792741859; x=1793346659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8kgvdSi7p94DLvTPbx85amBtEZGGbeahNZvNIQum090=;
        b=C/SU4UbaJPw/t6ektzYKGtv57lAk570DYZPf1LPDxbEUyIdquXSNRI+Qa527MU2c5J
         hZAAlm7TcemSP6XaBwG9IBBqngIgAzoFu7P4ShDebGd4sA6mx4/Q9+PZOqRUArtdSz2P
         eoDRZzLOjKg6fxO9bf3k2bY0bB9L7DzwB5QmMHdqufL2NrI3LxI8kB1DPVvqtEOrMA6M
         yF51C7JlGgTG5wIRYLgWBclIAyWHu6lvI++m9nT06Il0d4LiKLrxDrE7gLUmCtHNwPVe
         KJKQP7Frazgd+i6cxLGT3ZxzwFe5NNzfPGOkzI8Uwo+NXUn00Jzj0N4Rlwv94qWJ1XKf
         VUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741859; x=1793346659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8kgvdSi7p94DLvTPbx85amBtEZGGbeahNZvNIQum090=;
        b=hzw1xZO9GUp/QRiM+gGTAL/iEVyXVpKyAbhEX2eWrHnDnT2sOJy08ssvlc5+KHUh1q
         XnZreOC9WvFgupJdvN/OeVj/6IzlbVsAZ1UPdWwcK3qFsgVXBLr2OhG4tMLsKOTJOb3A
         BZzcJj242jzZMk+NvLWfxUT0wt9k5wnGUJ8UKTIhtYQ6A3qRyLimd8zVVcladxCU3FLF
         gmJMp5R0JM/Pql2L7HEJ3Lry/zOvBx2qDDRkSbZDvsQ5OVuWyvaxkcHpuFVmn2tbwnM6
         mKn2tRpIO/en2BLGPbRXZbWohxNGGn47KYIIPPHnkkeChIUXn4nSSONRPXM+rTkVU8kM
         TDOg==
X-Gm-Message-State: AFq9FYI91uwTdPu3pmkJ/MKle0xaNriEWfDhpGyXbiTK681mdpE2Rccc
	Pj+ytgn0O7OlEj3nFFXVWrU/EgQHABv3myrWCX7p7CQLsScuUm4OMhhZHyvVbQvnx0ZWBfiuu2p
	bwXfRXWkk4EiRr+uYlkiyC2g+iaW1kWn5G2vEcOFB/jArGvPcgfARR6STiTNOcpHrXNBO
X-Gm-Gg: AYBFou0c1Gpyl4bwAHTCHpYr7pLxYH0zlMbRbVrl9OP1Vtqsle4xPpHdfZRGRmA375/
	C1Wl8jXj4pIYQSmBX5xdJBk4U/r8n4ECrHdn8BKXCqH5k4Ig7NY6vhWs2YkQ3M9kGlyf9uLUaSJ
	8372Fvf0vsKi0L+h2E1+KbgyppmN9StU1fI7MwR9HERDuyAh7n+8UypqlhzrfjDT1AKNGHUOsWe
	eE9rnp+98ZY1Jqn2zzaUKhCay0KM/dNR9mvm9HdcSBiOiunkrxxgpKKe5K0lAa8FM0+X8Mpyxf/
	hsOymUGSVEw5pLvl2kvJHKdQ4ldlKmpG3e/iD0eVu0zVqD/vrpyE0qe3Nb32h78W3mXq7PSJDvT
	w3vc2/rtTQ2IVI1oRT9a0jQ==
X-Received: by 2002:a05:620a:8121:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f6f96e833mr316617185a.5.1792741858981;
        Fri, 23 Oct 2026 00:50:58 -0700 (PDT)
X-Received: by 2002:a05:620a:8121:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f6f96e833mr316615085a.5.1792741858512;
        Fri, 23 Oct 2026 00:50:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432c00eaasm820376a12.5.2026.10.23.00.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 00:50:56 -0700 (PDT)
Message-ID: <76b49f2e-d4d9-444f-853c-271c793cca4b@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 09:50:53 +0200
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
Cc: linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
 <0e5df58a-e97f-474b-bd3b-9b1a24ae0c03@oss.qualcomm.com>
 <CAAnD8RZ4+BFkE_dubDr7cj14wUaOfYUYWMw3_cwS5G0SrTsU-g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAAnD8RZ4+BFkE_dubDr7cj14wUaOfYUYWMw3_cwS5G0SrTsU-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb11e3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KixtmTij-hSPeuiw5w4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfX7jY1fKEBhhSM
 CevQzc+I+HGqSp2vUWoquPRVYvBzajAYf/yB/rjP/HnZe5OacupUpaXO3eDA/2zbQVSdLmMWhWh
 wfh4A5vwMdZFBXoPGAqD3JdvXoRJLLw=
X-Proofpoint-GUID: D0M4GYB5Fyb-U6ZZtCmVNcPsFAqxUAWU
X-Proofpoint-ORIG-GUID: D0M4GYB5Fyb-U6ZZtCmVNcPsFAqxUAWU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfX+IhActpvdxQE
 vlKqXhOQ6bBBDTzdFLcjgJVmgqJXpteyCI205/Vwqn3StD8fW16uRitmHzxRajtBcnuo2iTFzbV
 15MPrL7auHNe29q/Ehczqy4nW2HxbyjtoQoTYiHjIbErLtvG1rgFNxWlJt9GL7L3S8DZgZxOOtT
 OstspPwVC3KhvsJvr7gv/7jc4JmfX5Y2JjyTuLuPZEL6O+gQ211KEun+7qY/hLkeY4YKIgv71CY
 awYDVA9BF+jlMDzbzb97eojZd7ecwtuJvf/qRT8p/1H4RYRxb/xgVTLR87z0RwJA+9fZVz/vxQf
 o8KBWrj7XU4TNwzS8tpfxfTvli9xaOTrwKRMFY5D+K6dr8bw7p5VHrp8ckxP9tQqrIqgVR9jURT
 jGpX267ho9RbV5SBYlZSN030cSnpRZZAW8U9vi9OFFFrWhJ3KURUyaxkVDEEMIO6P2Cgb2UzgA3
 dH0trVHixTFOzLu+luA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230031

On 10/22/26 7:46 PM, Jeff Roach wrote:
> On Thu, Oct 22, 2026 at 3:30 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>>>    - The pm8xxx RTC probe fails with -ENOENT because this machine has no
>>>      RTCInfo UEFI variable (qcom,uefi-rtc-info).
>>
>> Remove the property.
> 
> Thanks, I tried that. With qcom,uefi-rtc-info removed from the
> pmk8850 RTC node, rtc-pm8xxx probes fine and registers rtc0 (no more
> -ENOENT), read-only as expected.
> 
> But the raw counter is not wall-clock time on this machine. At boot it
> read 16385826 s, i.e. 1970-07-09, roughly 190 days of uptime since
> some earlier power event, and it ticks at 1 Hz. Since
> CONFIG_RTC_HCTOSYS=y runs at registration, the kernel sets the system
> clock to 1970-07-09 early in boot; NTP corrects it later once the
> network is up.
> 
> So whatever the firmware/Windows use to turn the counter into real
> time, it is not the RTCInfo variable: that variable does not exist in
> UEFI on this laptop (checked via efivarfs in DT mode).
> 
> Do you know where else the offset could be kept on these HP machines?
> If there is no known location, would you rather the board DTS keep
> qcom,uefi-rtc-info (probe fails until something creates RTCInfo) or
> drop it (working but read-only rtc0 that reads 1970)?

I know you're using an LLM, but please give it some guidance to not
push for things that it knows are broken!

A driver for the  RTC interface that will work with current FW is in
the works

Konrad
