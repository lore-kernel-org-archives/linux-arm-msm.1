Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC64E42E000
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507927; cv=pass; b=lnW7C8266OFN7r7xExv1qcmkqObXKhA7CRIq+3wwJa/LKug5jdRhwmnn5NoZZMomeKs9eyYp0lCG4lqjsdC1HcPuiAz/KrvHI0+9/FTUg/+CQxahnTg+jT4Qlx4mbEDMSqMWXqeux+qZd9x5uYzuXFsgyPh4QY1BJI2gspIjGK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507927; c=relaxed/simple;
	bh=EzMoMaTdDGQBqIdaJmKzvd8zpTVC4eUSTXLdE3n4PwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWUj61ns4fbdycStHQVilMA4E+PdMpowbbsOmHv2AQ+Dox2aFN4dP5afjSASDYqjpNcrV+uvF9undxx975N9Z9DEjlRz+YwMrrn5h9DAbRd3B8NEXR41sJlk/jGRSFVrmy82oar+hjbsvF8x9QwN8h2CnrKeNSLoxJ2oB33PYvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dB0Hr2Jn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqrfcnCh; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dB0Hr2Jn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqrfcnCh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBeWZg188850
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EzMoMaTdDGQBqIdaJmKzvd8zpTVC4eUSTXLdE3n4PwE=; b=dB0Hr2Jn/dvSDwXF
	qBK7OpDZEAFPbfJFhqct+4W2FWvZds6W6as0ylgGYCzto1EqrjZGc4EaW4REIbuP
	3Gz97izsoKBUmeKXa7INLDk7Rav2hB7gyTQCFZiFfQzYmbN97TXZ/cVOnoxy0mK1
	ja2V0Lqk3F0AdluugG5fmM+L0CyolU7br5RmGf4Eue6yBvS4VdHCP0l1WasHs2ZV
	wxquCo/xfjLPVKiTTbMFRXQ1ZvGZRlLRkILW5QlCGDoubEAV9OYUYRdpsg8E2Xje
	N/LFzwazPU7MYQQi3wMoAEW5HS5+oMcO/oin86jXuqGAunmffOC9u2QBxcAf7YpT
	QkqvCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1u0nwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:25:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ac0a54110so113562185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785507919; cv=none;
        d=google.com; s=arc-20260327;
        b=MD6tHENK13YaUOGVdtmizSwY8p/GG1xOlpqHXWxuRen11jQmWgnAv7+mY4OeXwsBAb
         mVrJolFwzuNQyt/2hu4GE0hFmWfUEz8JNTwa6euym9i4OwcTF3WqjBtEcds28ToRlJDA
         iYcad6IrBhtswymPOFGoWlYreIW+8LIXvW3UXFKGMueJSQkbf/rCo23UptotBAiOVofB
         0YE8K+3jWTCAx33SLFI9i8qRBa28X5WIdgsEhyA9vyKWfeIuB5szZy/QzZ7pnbNcs3Mq
         tdcjY3wTMhDIZ5zzmXZVFIIWdyf2pdXTpW5Thn69giB8TgohF9k2PlrjTSl1ywYuVzv/
         +5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EzMoMaTdDGQBqIdaJmKzvd8zpTVC4eUSTXLdE3n4PwE=;
        fh=2O27M9DcQV6CmcovhaXLKzPHa1wOs/2MZ5hBgBqlGSk=;
        b=iUM0EOiFmBNBqfmcBc3v5Eson4OEfL5b1/NOpHsywSekoGFYn74maJNYeIF16XfigK
         izKUJTHmV3EAX9GRRTGr4RUQwFE4LBfwPpQ2h+lsFIf8hoG5VdURrtS4NMdhHNa+VAig
         ly/+gVas9bVha4G8MmlitetafTP2KrSbxNkeEi05IzI5t575NexJO2ptj3molg8liWeC
         EciEmhWKmaeFN2TsiH9o7qRgpcd8g28rAhcrzoEazZ1hzAnVi6zJEn7XUGyhgb2uBbwN
         +r4wCKugDWHJ2rXMLmFXtWL34/mxVAf0mEh39b77HqZFfVLa9EeqD3aB1nmdeLL1r05Z
         0FXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785507919; x=1786112719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EzMoMaTdDGQBqIdaJmKzvd8zpTVC4eUSTXLdE3n4PwE=;
        b=bqrfcnCh4RwHQecCX9h/Al3bDsnrH7RPC+RWxoDm6MjLl/EfGI4D1TvSnMj4C52Btq
         NcuLxhhI0YnWXd93ik9JYq74xqtl0k2YuJHwOPyRjMEzMLTgsZQvTEDBKugF0IoZzQDh
         OEdFsG8mofaluj6+tyddIi4VY/S6Mrg26BvBXoejENZgreVVcvIcolrVO+pp/Hm6XG3u
         LiAfDcfV/jxwhXaG5N54ZYCt6ebUvRMdfH0cuBZup1JXtS8ehUvwrDj3zcQztSbufaa4
         0/zfkrQesl2q0H4QD57LBclJNsXVQP7KHn8vyINYqNh4szWQJr11DXjoaWAYCh6xrkSt
         HMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507919; x=1786112719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzMoMaTdDGQBqIdaJmKzvd8zpTVC4eUSTXLdE3n4PwE=;
        b=lKFmWQvz80Anq97Ty6blyM9Qeb7tg0RJlaXD9qZjm9cOqBhXaNJkelrMurB7qu7tkG
         OmofjBCIzraQieYieculwis/qhFsuChCBi+KXGQYRMf7GBkptpkDyGZKkJfYUA4uuGuy
         7MShF6yafiQjgePmKqDngDU/p7ifm0ouVUQs0EnBEgNxC4p5QyGZBhHnp/Ck85gIOSYo
         iEJGV8gGV5P8HhYxDkueynaoFHodeV5EbahM1EHs5LRcbbz5WXr8+gCeVMv9F8nOA7Bq
         Wqu7yA2D0u1Hq7eAVbWQbWQdpC/4i65Q2pCNDkXLpp55OxPtd2EbLdatoeuRaq/yl/JN
         lw+g==
X-Forwarded-Encrypted: i=1; AHgh+RoyojVDoS1rPh4Mqqb6RsYK9pkOAdLEZlJNpcm/rIJR/QSj17f/q8NRfFEBvgYh6AzKsZ5v8kuC3bQnfpus@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5iZOaL0qld3tfN8hu8Dlwk4GxZzIyByBlz4X84txEJzGEwC/L
	latgbX0pb+smRdFcKB9c/iRPCVy9MOGSt2MjjSz/Xq0j+wvfWPWaeQYgyJFclR5WDx/rZLI0+Ao
	81J5evh2VTP/zzAB6gftgszHu7Z4dvFdGsXIzPibZlYIODigzO6VBIJACZU6mWVJE94SRGYgicX
	LQyjA3vnCOeg4wlsPobiCRc6eiIM5bQ8bIWx+Tlp8z+n4=
X-Gm-Gg: AR+sD10H0OmJY7UGhIHZgSoOj78MtMz4iAwASqkkB1zQd7X6RAjxy6EGlv08bOAgkmM
	dftrDuXgpjl4BnpPSaa2YJJpZG6BRcXbi3U8fKaUuIUwVBficbttFkqSDnyuLnfkXYmMPgShtpN
	Xgwai6hLEUfE+F14b0T/jd3iAXcdr6T3SmdAARq5RzyZ5bAcZZ1s0fMqZHzK5nEXWqJQmGzjEGD
	5X9kvilJYlA282c9N0T2SRnBzckeyGdrLAHbcJm2yHBBQu7zvKlcUNCTYKXKuOP7oHM2B+UDOss
	jPMnV2JUVQ27Gnbyvs4JSoTBCAfs
X-Received: by 2002:a05:620a:27d0:b0:92e:8734:b721 with SMTP id af79cd13be357-934a093c1bdmr27813985a.29.1785507918758;
        Fri, 31 Jul 2026 07:25:18 -0700 (PDT)
X-Received: by 2002:a05:620a:27d0:b0:92e:8734:b721 with SMTP id
 af79cd13be357-934a093c1bdmr27782885a.29.1785507916660; Fri, 31 Jul 2026
 07:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729-cci-clk-fix-v3-0-f3c731d1596e@oss.qualcomm.com>
 <20260729-cci-clk-fix-v3-1-f3c731d1596e@oss.qualcomm.com> <016603e6-8e87-47d7-96fb-5441ddbaeb28@oss.qualcomm.com>
In-Reply-To: <016603e6-8e87-47d7-96fb-5441ddbaeb28@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:25:05 +0200
X-Gm-Features: AUfX_mzY82V-q8dyHQoiYlzmsnaF9JauNvq3EY0Yu4Zwqm6rRPBr8DI40JfzuYo
Message-ID: <CAFEp6-1j9E82SzCKjYaFxhzYD-UiniEMPN=_Cqe4_NZVC2LHdA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] i2c: qcom-cci: Switch msm8953 to the CCI v2
 timing/rate config
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vladimir.zapolskiy@linaro.org, konradybcio@kernel.org,
        stephan.gerhold@linaro.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=H5vrBeYi c=1 sm=1 tr=0 ts=6a6cb053 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=XFPRkxQX0av47yOvrY4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwOSBTYWx0ZWRfX1OJAAHXFnprj
 ZVCGHNQ65wDRC+VTNz3lSWV388gFQysAxnBEtNkg/aNlowYSGGO2Fl90IUUlXUzrxDWmRWptd5c
 o6zuBNb39CzULIf/+hTfQmtjtMuWbI+QRQEmSO5HpKI80ssWhbxlRgb4m0zeUXX9CB9BWgmEQ6M
 1DBnR//TWZbUZM65K4JuZEznNf0hL/Rh0LGs32cDFWB7tO48ZwUTrsb1OlyCSMQ2nwyslkoO++f
 JgMpm75wkkgMBRvtu+2+s9nCm1KazyOQzp33A1Sgshl9SsUPc8ZHqP02v3yCcBf4RkqjXk424pF
 r3mbC3ZHZqIjhH5unFQd4181uk3B/lUPYi5zaPwaBualZW5gu4LdbPU/BvC13pq0yumrD8xOXg/
 81aNkvkpfR19vV6dYSNr3YP1WTUXFxDwrsOPvgK+CruvyH9V7xnKFpQz0mW6kBHl9iya1+KvTNC
 Qf29DzxsRVuEIYzllbw==
X-Proofpoint-GUID: lR-L37dfQc9ZOYnW3AI1EScT7sODmdQ0
X-Proofpoint-ORIG-GUID: lR-L37dfQc9ZOYnW3AI1EScT7sODmdQ0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwOSBTYWx0ZWRfX9OZkpBAZetnj
 M8CQpU65O28ml3arKiuEZ3V6dGYBQcMudsQYKnMxnFbmevU89gbRacJohM6I53TvO6vc23O2D9R
 XTgcQLCPXeXTomPe4goNh88c+geKmVY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310109

On Fri, Jul 31, 2026 at 4:07=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/29/26 2:25 PM, Loic Poulain wrote:
> > The msm8953 CCI timing table is internally inconsistent. Its Standard
> > and Fast timings match v1/v1.5, which are calibrated for a 19.2 MHz CCI
> > clock, but its Fast+ timings are essentially the v2 values, which are
> > calibrated for 37.5 MHz. Since all masters share a single CCI clock,
> > no single rate can satisfy all three modes with the current table, and
> > the DT assigns 19.2 MHz, so Fast+ timings are wrong.
> >
> > The msm8953 CCI is the same hardware version as msm8996/sdm630, which
> > already use the cci_v2_data config (37.5 MHz). 37.5 MHz is supported by
> > the msm8953 CCI RCG, so reuse cci_v2_data for msm8953 as well and drop
> > the redundant, inconsistent standalone table. This makes all three I2C
> > modes self-consistent under a single clock rate.
> >
> > Note this requires the CCI clock to run at 37.5 MHz, the driver selects
> > and enforces the proper rate in following patches.
> >
> > Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>
> Wenmeng, have you actually tested this on MSM8953 device?

Hmm, No, the b4 trailers got confused after the series was reworked
and incorrectly carried over the tag to this patch.
Unless Wenmeng provides it, I'll remove it in the next revision once
I've collected a bit more review feedback.
