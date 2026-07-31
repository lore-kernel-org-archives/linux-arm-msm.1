Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A763D9695
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486682; cv=pass; b=SO1XN9X/aYKv6OI1N79N1pVPcLM1ENggl/08s0N+VavZ2Wn09lo7Q98WvaVH8ISfHUci/z5GxORyOWEWFlNDYdPuFyleX4u3kKtAl+l8WhdFMZQ/kE5OHiHgIK7K6dOWi4+cnTD5spoOI+bPX0qNG8vlosWu4mRBpUcgKZeYlDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486682; c=relaxed/simple;
	bh=4SOPzjJOmNN4NKbTTedD2W2xht7x4CtF2UCYiAWozjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oimHpQGY0gmmM9Sp9IWbCKifgt+ZHSfD3BMNyc/ArIEzUD7Pk3KuD1cgCHE9pacHDALYgo4Lp9mia0YcnGIrmgWTmVuO4MiJsXvS/Sa93TGZneER7B7kh9HksCHLb/CaJeRsvqF3dNZEM6s1tupVcab1+2e1CCgUVXFBi8c4mY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMA1Mxni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DecPPfDv; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMA1Mxni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DecPPfDv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V84wMi3408208
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PF+BzOa+IEPMI94ujDEgdgKxG+Ci6qvQzzYwlxof+Do=; b=AMA1MxniyZT/Flow
	UzWFeDU33q/mXhj+Ahpd2uOCEX5vXqQxRu/qiqAbvzmgJtTxvqqIKR/EVAgo5bdg
	VmUYXl+64xibnLDDL5TKHO+GzJ5SdxcxN3VWaLs+GAQ9jKiB8StMu0Pi+nACQSYZ
	6piIyRF6slmTC4f4X0TGytuZvCI04jXl+ghtbFU8TGHsaEy3Y+GUFu6sYXqvCEuF
	9BgbkqyfIA0S+VT0dDclC1sa2vRqi4PAAqsm7+3oe0U/6PkEDbfSqsQOxTiUzhHb
	boygPMpgSOTf78r0xfc5VSBrrUAnaNEGX1/GKdzEzGYSl3qKhI1usg76yrjOdDo2
	6rug4w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frqvsr308-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:31:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93106d8af18so59523285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785486679; cv=none;
        d=google.com; s=arc-20260327;
        b=WZv1xHYDpi7+C0BH3WpiO1PxoPxm4+NPqe1X76PgBDRvHxFJ7OER8lA0cIZzXau/1U
         BNAcEgm7QNTN3Qar3TKZUexyX4nSQ1g8QxXQ+M90rIFnLUV16olSdiQFzR/5HaG8teuY
         aUY0U5FiNnnOk1QSfgaZuIWM70zGsUMCl8l8imRVSVUJJCC9Decs4o9OH/L6uP82+PnH
         qs6jUAp+QFs5uflkDEUM6scNY59+IoQOgbDNGfqOtEiPiiR/tR+Crwfa1MMupDvXTObl
         oVyaQjJa1GFKPJ+/lvjtSK2aPlpFaEyRc5bDkz01AZlbnhOkhrJXSMji0Nsn4WSQELGz
         dbIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PF+BzOa+IEPMI94ujDEgdgKxG+Ci6qvQzzYwlxof+Do=;
        fh=loPa8ocIaSYoFXEcFyPb7fhnB9j+sTGrxSNyw7dp80g=;
        b=h9ipKOyq3WLfmIcO71uFMeXxpkhPxE0m/5BjuDMN/Nar8O2DH18w0RzYXZkuA5qHIM
         ESH1zjOVXhiKQ4OinYiix8mA7TseDnwNNTsw+8IhNnNT+mTV+AHP0YMZzQfM4m7HYJ57
         qck4g/J8C2K55yl08OJDGuDjvEdBxfEwM/anVu/JG12HZoVCN7zKsXl09JDJYDqqNrHJ
         td2DRPG0e55MK9pWBf3TqfEoJ1ECMjR5wItwuMvt/1ufvqjFCprE6pi3Wkra1amsgG2E
         iYMhv5BXomi414BVxJLFIBN0EOGt5BY8Jb0pfQFlOrw7vCGVauTD8uxYyNQJ78YRuOhd
         bcgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785486679; x=1786091479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PF+BzOa+IEPMI94ujDEgdgKxG+Ci6qvQzzYwlxof+Do=;
        b=DecPPfDvHnfSd+qWxbfEA1goHPMGnBHx2U9RE9mAjy0sjy6RflmpLS37l2yH9qBqZE
         6noLgZcJCDakbXINHWaojX/UeJjjAtXsa+WdG/LlZT/7L0LTjjvbMrFik/68tsUv9NUG
         ubyMV99Ju/e+oPMkRyUP4Xs0NMIcV4y5NVEq4mRStO+cvm0OeHXp9NMsvwEdUfq0tvRh
         aL2/hRxbUh8b/JtOcIY/7z46d9OXaWzOPudofvofN8r9zVHi4bH+Qk/0BVfBFX3F3EUF
         cvaCBBy7ACN9zwlUiyHdmMa7qEoocGe8W+xOlvUytW37SP8aGiV4Ir/KQjoKvz9eICdh
         BVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486679; x=1786091479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PF+BzOa+IEPMI94ujDEgdgKxG+Ci6qvQzzYwlxof+Do=;
        b=WNYsbCLV8W+bdOdIPPG4h4OrfjmE2kRq850ppXEmkE2lOsBrqwjWkpEbkOiG7ALhOE
         wfuDc4s/5KDVo6ZjA+z5aKHUuyYLm3P5wRNcMG6iErZtSsDBUYGucfsakuQcY5OH5d7C
         EC2C0q9sGVMM1H/4Qzo1dsIaI00OWVQGPHIlJSDmVgt8Nt1xklxrUpcAvnuBpxQUiJog
         9xCkfkPX/8rNGoAuNnUwDZyJqVCBzJUHBByCykX3pqXdLBtd2oohZ2Wh6vfdqWpLk+GK
         y4qBvLnssXIrn1Eh0cja59GJA2hY7JCENgGEfkzOMY6gqa8UZMaBJ0vLrGdopmQGR/il
         aJ0w==
X-Forwarded-Encrypted: i=1; AHgh+RpnPwfnwS0nUJdPA7i7Q6fa/7fp28OL4ctsNnzZJFYDmh+oebO0RjgW5VyS5MZSIhAo0fTjUA73A9nAFdd2@vger.kernel.org
X-Gm-Message-State: AOJu0YyS3Y1lrbbnW1FJtIDSHQjC5sv7zxUYzEQxG4LsaT9FR4VZnDXR
	hGGBx+0HTVpXu++mK1uxXVWuFYluAuQQSCQ1WlV+izBRg+h71wDNg8t7uleZsfmv+56VzO7gU23
	fYXkd/fE7TMTFNSBVdPDZZe2oKi0FqUfEGnRDBlZnws+Qz4Deryd7d55wFn03cKH+zWJyw+pHIc
	nhm9NVBN0NPNeSVLsskkSI0dSkfRrrcfpherp2pwFLMp4=
X-Gm-Gg: AR+sD10CTn3BepZdl3suExCReNOX9u3UtU57Kz2xYzcav9ML0MNFAwE8MaFPRRhceNV
	9bZijjbBtnLT+NavgEtTjN/Vlf/tgw5p2Sr6ZII2Z0FYX8CpKpwWljm9185Lu1dcf2a8wK39Gli
	boYyyHDyq/5QC0vwJdURY53E9jwieOGLtHq1FGPQU6TWq2sO/TAvdnmekq+S40vB0umkfyBvIM5
	uTY+ClQnBgi1KiC1R177AgtTTwogp1QoASuj69O/vRDhslBqOQiHYNDMd/idNcuJ//cuVVEI1c=
X-Received: by 2002:a05:620a:6cca:b0:92e:de8a:d710 with SMTP id af79cd13be357-93496823987mr129847585a.47.1785486679237;
        Fri, 31 Jul 2026 01:31:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6cca:b0:92e:de8a:d710 with SMTP id
 af79cd13be357-93496823987mr129844985a.47.1785486678704; Fri, 31 Jul 2026
 01:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
 <20260730-camss-version-v3-1-74a87302dd9f@oss.qualcomm.com> <c2636e38-fde8-4ab4-8103-c3c21dee5c1a@linaro.org>
In-Reply-To: <c2636e38-fde8-4ab4-8103-c3c21dee5c1a@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:31:07 +0200
X-Gm-Features: AUfX_mwdmpbruSgXCkaRGtVeIDySdEgLb1f76KIQTNgn_MJJEbwFXpdDDLuv_oE
Message-ID: <CAFEp6-0fa-TwcyHd5aSRdQ_ioBEFg+YvjDz7kOD2eHphqJt_yw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MSBTYWx0ZWRfX1x5NccK7Baym
 39cyqdYWWdQXh8d9eYuPr++cLDfKh1+07+HYDsoCpd1+sgl5MUbX/3Q+1uDR5zZpCNHne7ESorQ
 j/qB9ETgkj+PA+ZF6Pfl/Gxp4ngMGEE=
X-Authority-Analysis: v=2.4 cv=TN51jVla c=1 sm=1 tr=0 ts=6a6c5d58 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8 a=zeSE1S4S0imvIZae8tIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bHN5dccMrCM69hwmKI-IniQtR4nIo6AC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MSBTYWx0ZWRfXy/qOz1/JLhDI
 ZsfJTGdUx3Ih+0i3xHZ8KUiYkS9gHgb6D2l7Ddt/b2jFl1rk05jJvonXZvONGv3plLkBi19/nO3
 kjzJQwA85Vxr2LDllIXXdCoAUrSyJzL8l32bh95ZSuDaiUH5QDuuTEySd2SX5Xo+u+WYuaOdE0Y
 gTxKyvr2G7Jw8XWpoxPoxMzfKGf12vqktlf8jqoP3hZK0BVZeLCKbh9N0hAStO6eBM0A57iJfWJ
 BGfU/COlcWmCSV3LWOqu+HtD4EL/NLIUKQ/Hw6nLAtPbuKgzQcSVdbqVIlh9pw5g1EAx8Lo/uGf
 Qu3zv4YEgEA+RvkLmMEUj/28G72UzqT/vBpema9ZDm7z3aRa7Y/W4XIYhwc3RX9N+7OQDOnq9+y
 YB4PL9qGOoIJR8mWEIHbVoSLNK+9NZ0BrqJnLuk+LYbj7iiRPTb3MRUq/XdpQ44Mid52Znhfec/
 3EtKVS7qQ0iTjtpnPJQ==
X-Proofpoint-GUID: bHN5dccMrCM69hwmKI-IniQtR4nIo6AC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310061

Hi Bryan,

On Thu, Jul 30, 2026 at 9:34=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 30/07/2026 10:24, Loic Poulain wrote:
> > +     ret =3D camss_init_pm_clks(camss);
> > +     if (ret)
> > +             goto err_v4l2_device_unregister;
> > +
>
> I don't think this makes sense if !CONFIG_PM_CLK
>
> ->
>
> I don't think the read routine in patch #4 should happen if
> !CONFIG_PM_CLK either.

These clocks are required by the other subdevices/blocks regardless,
so they need to remain enabled. The simplest fix is therefore to
handle both cases in the initialization helper, use the PM clock
framework when CONFIG_PM_CLK is enabled, and fall back to the regular
clock framework otherwise (which should only occur in the
unlikely/compile-test event that CONFIG_PM_CLK is disabled).

Regards,
Loic
