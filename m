Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2727A3F1AD3
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145558; cv=pass; b=Kr8eK+XXzLDHtbbkOgqHU5mT0UY7LzESdAUiOon4ZojcMu7zdmgD61f+8m5fo/czAEDmHzxG2l9RHi0dLYERYRH9RbGGwEqg3PhRa2nFgoR+LYx0D0aF4jn8KOU5ta2NT56vDVo+sFPra/f+9wgagDU+YuceVIKnRmXrgtDPPEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145558; c=relaxed/simple;
	bh=mu6tqP4n2BXyp1b7zDoOv2JB+eBkLWB/j7TibZCCzOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9bY0HZZ6yGmvDUG8/G1uZA/hszoRmIbDzkInVPmJwiq+srpujgWvBezzZwsehbODr4HPDBr9UfrbuiGnQGvP8kjvn14tgBIyGpTQ16bNsgJYMAnhMTMt6RK4h+W5eGFvLRKP32cvsMAEx29dtu69wsyOKQfN6bZQ7tRsa/U7pU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzBdEgsM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6Bb3YPR; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzBdEgsM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6Bb3YPR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9WxU43490895
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9jIGX30jRJ785ZTPysrFlAseyWnVDAEU+wzUDkrCcO4=; b=HzBdEgsMhRbjIC3f
	xfKtcaVzUN9afYRVJ0X2TAOEtvTXOHaFNJYzXMKLcDYR+C5zjmEFJxc3vZmdCd4i
	IjK2PiXE5nY83QAE94sx4rMesrSZ1frtN74y0aQ31kcvwG0B0F9lLyGa3wHuc5lS
	ZP67vvA96uyVt0PUmfFmMVciR3x68oI5nTk/ohCcnWOz0BESf7a5Q6AZ1vF5OV7v
	kJ3KrW83tAU1uSz4K5UKKod6Di+t4g+rt048r36t10WsrzLyQJhliJ0haikvsP7J
	6znJg8Sl4gxmhMEo8/EQhX2dd1OpmCqdrH+xKxFCkrbSM+y1WFxyHtAcFuuEvkyk
	mscpfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngystuqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:45:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93106d8affcso197084585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785145554; cv=none;
        d=google.com; s=arc-20260327;
        b=KB8uyDkKvOttLSEFGXvhEkZ7P4+pCQC/tA8VQqcvVOVr85o7mJ0rALj0+i9r0ZzJSM
         Bpm7yxRmHcFVMUWCBeU167UXGXaHFdHIli6YdbfmyDdK09IjGq4kJaDISFEfUcqm1ydF
         ULpNru6dwZfIThRm5mmuDAS5rq4Q7LHHijdmZ2pITEgvFbkNbn1b2JvZnaPLW/w87xT0
         yNT5Cg41YdfqkZiwiMgAIr+rjO65YRd+KmKzHbg4zU3CTyIwb2yPRXUTgDgXRxl9+zVu
         j1LtMF5aU20VRwkGdIKt/5y2VKdyt8vcNhOk13FdEciB3j2QcS8x3k/acdusZkrqvQvY
         yCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9jIGX30jRJ785ZTPysrFlAseyWnVDAEU+wzUDkrCcO4=;
        fh=jBhRHC5ZhzbXDW9vJAXn94QzV+NEvv1vjLfQKUpD2LM=;
        b=kQFGmc2ophdgosXpt5qZRTIzsouCp/y94lD9mNH/8zSlfx/CkJIucMg2EVcnO/Lc8D
         qoYJG7QbBZyALFuAxqSGPD2VOyXK6QmzNCp9OmKS++fst+t3uTJ7aBnPKmu2F4v8kgD3
         A53jhhtbcHjyybETwuyG7pPNFtZ1kym0xKfPE8U9pVfZyflnBMRZjjGV7oLIoSEKv/8i
         h+/cEpNwJkXa71ae2ztzJqJIVPvTJUs+UTg+gFS0OI/PKuKW69ftQaTLpD7ZmH7797Ui
         VoBRJ85mcrl4iJjXrsOdhBl/5b7GL25/WtIfk7memYmJs6de58yoZqyRs/dJKqWQ8+wB
         LStQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785145554; x=1785750354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9jIGX30jRJ785ZTPysrFlAseyWnVDAEU+wzUDkrCcO4=;
        b=g6Bb3YPRWV6aHm+7ZgUJ1JdAUiCMSA82KozveVXeNzGFEFXeI8Px2EvBMFcJUFPcTn
         Wml8bsJPBG/PPB9b00njIKwWaZCn8V7sAP1vldNkGp/x3+PtwIwwSWNOBGg5MZ39vX82
         39wzd6quFoUfSeSCAxNKjvXhhq0bgGMt3JZi7g23eTmsHT/Gz0DM/92hfSsTD9Qq2dky
         eVZhetgBmdLTcRecc5+VY9Ongy4PvuniBb0T8wiRCv4xIg25s3wOYDQFQ7AoRv4LSIxX
         oUzFpDdmtWVwotv4hPAQjxmbcJAmCON9oQQtgW8djBoSdXbQSG0gJ/7iVlpcJ7rJr4cS
         q1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145554; x=1785750354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jIGX30jRJ785ZTPysrFlAseyWnVDAEU+wzUDkrCcO4=;
        b=g/1u0P9NOF5rRGA1Ht/bFDn+aZvo+dZW9oZ6ARiUP9r7orYlqqLRAUnsbfRmysKCyC
         kVft1eH+ob+BLSe884402JfhNmEEtX6drIJAHrOx1F7D7U1PMGHzSU0oiOSDaG9r0mOG
         r8iXXmqhuHw6EXRX4nRt2HoZapzhJ1vIZSXn80KKE2ljs6PGOYwN4lGPxmRz/N5kVsyu
         i+5Qm5zudNLmNNbJk5mgcfLclp3LbLblrhspJignuaO0eaQKqjg6ycOXCoCjtba3Rp3f
         TKbbQEF+9HXhYsGDKn+8ffzkpynX9947gx7wDo+pgUddc8Lk/d4ADqFGBdmDmV7bMT5C
         Bh2w==
X-Forwarded-Encrypted: i=1; AHgh+RqW0RG9xyFX0/XmKYjeB9kP1CheEA7MRID77fBJRBAI07pIgJXHVtwOtJOO6kQ3qSExT3hD6dXXW7ZIgMCt@vger.kernel.org
X-Gm-Message-State: AOJu0YzSJ+Q1iB49yUZokw3ohd3y+oJPlaRmj6/fWtIw/O1W/0QdUWg+
	ijwt6l5pJkXrMXCtqMMrqJHb5DgFjwMwKCn+56tR6BNnMBe1RhqaizoWZ/A/b5VBd23JSD71gFx
	BoBOVDOn35+7Fkt7R5z16hS5aAL872YC3ybAwj/uVbmoLsV8fuvhQoPDLPW8e0+Z9RnvqUhvu/v
	FLvrc7zw4/9VYKHG+KAm482hUX1OkWfc0pjhwx/zki+ZM=
X-Gm-Gg: AR+sD11D8PcW44ubOfNmNl8OED5v5OInf3Spe4akZcXS+uazqqslznD5MfETjlzC/l5
	ePYdW59WPgY/cWvuhNMF9ZgYE3rBaH308zagPjza+hPmIE2XaKr4wAs8iAzFZi8xRrNShsFoggP
	Yr6bS9Quz024dEjkDXm4ypOMuW3t8uHjEtVqRYl40S7KHeC4KWpnNz7gjp3AzRZUIFo1Z//Q9bX
	CEQfxiqc1fy3NIM4hUgFjwj6ki022OIb9KvKAbAqJjYjRV8E5bi5NBF18mMg3/8U+BW+j9p4ns=
X-Received: by 2002:a05:620a:44c8:b0:92e:81c8:3629 with SMTP id af79cd13be357-932df62587cmr784207385a.4.1785145554149;
        Mon, 27 Jul 2026 02:45:54 -0700 (PDT)
X-Received: by 2002:a05:620a:44c8:b0:92e:81c8:3629 with SMTP id
 af79cd13be357-932df62587cmr784205985a.4.1785145553714; Mon, 27 Jul 2026
 02:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com>
 <20260727-cci-clk-fix-v2-3-c3958f28b045@oss.qualcomm.com> <f127746a-6b8a-4146-8872-6790431b563c@oss.qualcomm.com>
In-Reply-To: <f127746a-6b8a-4146-8872-6790431b563c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 11:45:42 +0200
X-Gm-Features: AUfX_mxZgaPeOnTxeXUHF_4ciOWWT8hLwJofeT3LrHwQFFJFXXT22uksWDND3ao
Message-ID: <CAFEp6-0bZXmh-2+ZKujZg+vbJc4ZYzVOq9zXbsbDwVGz3XLBHA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: qcom-cci: Fix CCI clock rate enforcement
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vladimir.zapolskiy@linaro.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5NSBTYWx0ZWRfXyx53JQpq9X6Z
 D4OV6yMybiqSrXSQ5YGjy0kEeyajQzkqhN1OdAnlA99NXQmD0/1fpwetqvfCbOUUjOpAcowyGIA
 EFRrX6UFNh2Zbtru2z/3Q9Ec+F/NQ8BnlbPIccwRsFo+2nFjPR3tspNLZrBG/sOZTc4cW1FQRjj
 jeS9Jd4p13bNDPWLpNgKd/fhemJGcjONcaM3oU9D7uId/KPKvJOBr660AO9bBHeNO4de7wtXcZn
 1eNo09+FpG22Cx+kEQgM5J9EerN+yKr6T8E66+h19ndpeHt4RRkBj44j8Xmg3H6Z2EeT08srjYL
 1hmHXGzReD8hqBAoZ5B/Dr8CsCWdLpjKv1Tun7k8q8wC3o7UJME21MidNHanasDDl2OHtkXdcgC
 0I3sKNiQlPfCsob0b/YKxyiwe1hSyp7r3qR7tLFqjRAmxt260ethwYWBqUgCaRTV8QHRftB0rHk
 XdYASv37dyypTbJ0hUA==
X-Proofpoint-GUID: Q9bxrXG3SHGD8edNUqUqGheAwtrnzkTO
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a6728d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=t5tfKrHthdDDn-AfuNsA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5NSBTYWx0ZWRfXx7EmhbBimoa9
 fGy+hRWqJ4OqEHgFfPqGG00gqO9BhYteVu+QTcT4S820LS7+ph3KueijAImNzlzkCMUenfmIYgg
 XnVIdAzAGITQOCXtyKybcCVyQDfuMqY=
X-Proofpoint-ORIG-GUID: Q9bxrXG3SHGD8edNUqUqGheAwtrnzkTO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270095

Hi Mukesh,

On Mon, Jul 27, 2026 at 11:33=E2=80=AFAM Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
>
>
>
> On 7/27/2026 2:51 PM, Loic Poulain wrote:
> [...]
>
> > @@ -587,6 +618,24 @@ static int cci_probe(struct platform_device *pdev)
> >               return dev_err_probe(dev, -EINVAL, "not enough clocks in =
DT\n");
> >       cci->nclocks =3D ret;
> >
> > +     cci->cci_clk =3D devm_clk_get(dev, "cci");
> > +     if (IS_ERR(cci->cci_clk))
> > +             return dev_err_probe(dev, PTR_ERR(cci->cci_clk),
> > +                                  "failed to get CCI clock\n");
> > +
> > +     ret =3D devm_pm_opp_set_clkname(dev, "cci");
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to set CCI OPP clk=
\n");
> > +
> > +     /* OPP table is optional */
> > +     ret =3D devm_pm_opp_of_add_table(dev);
> > +     if (ret && ret !=3D -ENODEV)
> > +             return dev_err_probe(dev, ret, "failed to add OPP table\n=
");
> > +
>
> if this is an optional why to return with an error ? IMO, further
> operations should continue which are not opp dependent ?

The OPP table is optional only in the sense that it may be absent,
that's the -ENODEV case, which we deliberately don't treat as an
error. If a table is present but malformed, or can't be added yet
because a required resource isn't ready (-EPROBE_DEFER), we do want to
report/propagate the error rather than silently continue. This is the
established idiom (spi-qcom-qspi, qcom_geni_serial...).

Regards,
Loic


>
> > +     ret =3D cci_set_core_rate(cci, cci->data->cci_clk_rate);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to set CCI clock r=
ate\n");
> > +
> >       ret =3D cci_enable_clocks(cci);
> >       if (ret < 0)
> >               return ret;
> >
>
