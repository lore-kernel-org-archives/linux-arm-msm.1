Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBE835BDAA
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165562; cv=none; b=LCbqKzwUUtt+NbCYzfe6hsyMs/u3AFSWnPIflTGOTLIPzA2oxBzX/QwxTggobHJQ5xcT8e649HaZVsyJq327GoDP7OPT6tyWWFJqdrjXIIU6wtsFy6QlUGswd2kL4zgw1wO4oyKGnH78m9mO89AQg4NwOIIPbATh8opG+dPGh3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165562; c=relaxed/simple;
	bh=osMTHnsGznPzOgq2+7JWanAZThHaeW5dVV+gMpQPPZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBQuVmdVm/kQLJaqdoSCLn/IVVPIbY1cRfQUvsLi2JE954CH6mV5XCuYj3UNmnBNWUfgpWEgrCZEEwYwTXjLn3NgCZSL0z6/8JUjX2YWDSZipmnvM8o8SEcqd8kH8BP/qd/dtee1vmd47itbP1ordD+MXC+b26YesR7SRUThYeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQJqCtDf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0bkdbKy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQJqCtDf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0bkdbKy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDmBS43823735
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5/Vl312DYfGSYqw8ngN0+bZHTiDTUX1IHF60jNSBHv4=; b=lQJqCtDfjuuRIyX2
	VpgPFvxqytfvdwDrvWe1EvCGXqfNsxrDxkY8CZugU21HFzNYlNcjWdy5bjkn7y3v
	2gFPOf03dECQcn5QWvcKsqfgev8tw4SyZaWu6hYE1BlYackOlQEXINvh4uM9calP
	lB1PneLByRW1oqsbObgdR0pYepoYXZ1PcwHCLasO9NFZ5MmgUyDt3Bs7hRVTl0ph
	lp6mMXWL0rxdnE/84UDijUeS69JhOEbIvw75KrjaQtPgygRvyDrEHY6uAN3+FyA3
	NKBWL3Q+Nbhqx1midMrZi0MI+F67FPMs+9+1hPGw6PR8lHmAY2CyVjzQE13NfT4i
	oSPiRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbsf6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:19:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so35659981cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785165560; x=1785770360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/Vl312DYfGSYqw8ngN0+bZHTiDTUX1IHF60jNSBHv4=;
        b=d0bkdbKyh5pNQGlOH7y+3Aqi/p56C25Vf8OU/m3QYSespLFuUJdRRbUZ9S8LmUwmo4
         BFk5rqQyJp6cBdRUtMYRyx95aSiGhhj128TYtVddFci3rgHBkqCJ+KMc4Zjuu7NrngRy
         maPPM1D8vHCKUVxFI9NLf8+D2+jiszwsOF9bCgcUAADUD6ZWOn9vakDlLAxuhqLY/CKa
         SghbO8bTD24frdsirOcncgWCf0VhYj/tal6vOXfN2bNSPAVLbnLX9yzrcCW/dO2PIIOO
         czLymx/XdD/NpWpbbkXAoSaeU0BzKuqt+YK/XdTPVuRVsqNunE3UmX9C7tJBFybg199P
         N+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165560; x=1785770360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/Vl312DYfGSYqw8ngN0+bZHTiDTUX1IHF60jNSBHv4=;
        b=sOrA+gcxX1LY7xRUU0nGM8mGhhmxsZRK1LUNdfJwn4EygtsfWIauihdroEOGytXQ65
         y1+XtaGVJIIMvqKXAlMRsXBRFSP+XUoAJiNRCvjhXU40XyuhThccvkQwbGSqJy0Wp50E
         2dTbP0a8JeYI97/SJFU5ySp7dqQePPmUc2Cs+mWElwkVGVWNHhul0gZp6durgN60o6qT
         uQKgnhtVONxiH5ROMVWrNClWqp9bZX3tRjSdUd+zD3lE7WNJQAFC8jFGsKkt+Vajlik6
         zgOB06M3EsMj1cj0G7EGnSIttuKDRwuweUzWglbp024Lm0EkUYPvF7dMuz9kxY0CbrIE
         DKwA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+bPDlv4fPA/aJBqnf9J4Nl3pWXhXUoedo1CYbmqx6TXQMJoUCdoyYFz2cH4Fcp2810tycfxBK2xQ2VJGV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5oQEoKTo0gEiLqctOfOHawwAaiOf7XUd4ys7ykbOzWIQXI3nT
	ULGXUxj7/hKjTpNNXVKZjKygtWSxUo8chnlsEfjUGY+kaokxdEmsxFhE5efSiVzHGzbvY7ntNhQ
	4/9UZDrpuvjyOM7gUM8qUZexXwweiMZmuh4GOC9B4hKDfvffHN1FIWuJwZHZjPWE4Aqh4
X-Gm-Gg: AR+sD11KmTf75trokLrlTxt+ldNOeHi3+VYAkBrxUQCIW1UNYnX9CcylvqHK2R4gHxL
	VICfvxoQfgRjYWvwS62b1dVt5FxoeofKt1gEhq2D7FIe8u5U/uP7s6S4PhEWd1wcJk+Dnv7tS9o
	lXGj2kns0t63fHYFBnZvdjQL4fENPU4PB7s6Vg2qhnsrs+QbXf99TuM41vcpcC8hje9yBkzbd9y
	yeulgccQ0Oydc5HT3Qx0j1EjVvhjiwSQ6FOvPTOPer6hCTnQksOTr0VsMJ/KlU7BtwxVglM9+Ya
	rUemF6fl4hPTqydOgZK7How6Vbsj3keYpJuFtUkxb26BgEX2oHr0R/Z5WD+tA83qI38ym+klmjm
	uGmdoWZtQMBW5CAP5bPCgVN+BAJsaD0O2ooUeIluCd/8kIQ==
X-Received: by 2002:a05:622a:349:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-529cd07102cmr12547761cf.78.1785165559425;
        Mon, 27 Jul 2026 08:19:19 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-529cd07102cmr12547221cf.78.1785165558959;
        Mon, 27 Jul 2026 08:19:18 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm46610113f8f.10.2026.07.27.08.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:19:18 -0700 (PDT)
Message-ID: <02cd566a-bf10-4d78-bb56-420db140dfc7@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 17:19:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] thermal: qcom: Add Qualcomm SPMI MBG thermal
 monitor support
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260722-spmi-mbg-driver-v3-0-ef73064f2789@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260722-spmi-mbg-driver-v3-0-ef73064f2789@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d24ccz0EJogIJ0vIQNhUYmDwJYPZn-pv
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a6776f8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=U97uXkcDBxVafT4DzxoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0NCBTYWx0ZWRfXw+Y1J9AgxIgr
 Z9+RbFbP4Ye4MLMIxWlZ3s6y3sJkR/NdSjIvdw7rKEoFEit1MxQIXO985Mtk/QHndGaiVaP1BWi
 G+YERBXtg5JvVdRxfArlQNQtA/PQhNw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0NCBTYWx0ZWRfX7ZUKnSXG3hXu
 PDJHbNX5PFAvyxaAE+8V7srmXhE6VNmVJHROSnlsCit2b/3V5O1j9fqYcW6E0fcoudKjrurbvMU
 c1DMKgEkePYl911GAZvfjroec8e5B2rVgrLkeJ7T9sjF5VNLR5ePwmnwMvCc6G4X8HS+Byu+ZN6
 IWbXPYj6djJmp4EK0NZ3LsS/y+8Zmhj8Tt6ktHQz43fDh6+5KbO3q81H1T0h17bUltwoj3P9e2I
 mLAbMeK616Gg0mZnzFvxoc8eV9/wBNckEYY9fPNNB453rFLofl3czixviBqzmmT/jFIvqWrMrKC
 20KNrMH2DwktURn4jmbGhvRXKHjL+D6ibnKWDC9tXwY6gCFIujIcl1M7o60XX67oFEEsAEN7XVk
 qTH7he+DJ9QVlHnNaDGrsMeXMQoHvpTTT6EVw/4i3jtm6zCP8NIrh02sGO/NhJOTfHqi5OmwSSm
 JxYNTcOaQShB/UeGw5w==
X-Proofpoint-GUID: d24ccz0EJogIJ0vIQNhUYmDwJYPZn-pv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270144

On 7/22/26 12:44, Sachin Gupta wrote:
> This series adds support for Qualcomm MBG thermal monitoring.
> 
> Adding support for:
> - DT bindings for the MBG thermal monitor peripheral on PM8775
> - A new Qualcomm SPMI MBG thermal monitor driver under `drivers/thermal/qcom/`
>   
> The driver monitors die temperature alarms, handles the MBG interrupt on
> upper-threshold violation, reads the fault status, and reports events to the
> thermal framework.
>   
> RFC patch:
> https://lore.kernel.org/all/qq3cggafexwpdrv46eqijxfmrdbqusl2vpbuswqmcvshqueaiw@r4mrmap4nwkt/
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> ---
> Changes in v3:
> - Fix Kconfig description and update commit message. [Daniel]
> - Link to v2: https://patch.msgid.link/20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com
> 
> Changes in v2:
> - Fix locking, -ERANGE, enum check, and flag race. [Sashiko AI]
> - Rewrap commit text, rename binding file to match compatible. [Krzysztof]
> - Drop redundant comment, return -ERANGE, fix ISR locking. [Konrad]
> - Link to v1: https://patch.msgid.link/20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com
> 
> ---

Applied, thanks
