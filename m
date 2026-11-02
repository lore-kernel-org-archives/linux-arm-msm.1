Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632744;
	b=ENp+3B5hqMkxLhbM/TB6ARQnwHsNs/hk3GRJOf2U+k8XCjRLkVr9l7BYPA7jPqWgn44T
	 qmUX2afd6/RG/eG9wAuvqhgrR1iKRVGsujwrvVJttLEUL172Fo7vrrSrg6nh3FexkBD/8
	 CIhvMUnarInEVdFAKHKyIHtoiAQPAI1qH52bdFxR769QIX1nN4K+W14V7kbTzG7zIf/dn
	 wU0Xva5VxOX4Po/zUTHlQmftqrD0isEJi0yHrlGKQzG3JZcUTHyObpAE7uYJVGpM4d8RE
	 wXWQoB6S9EP1V5zzGbxeAYxK/hKy20x6zC0gHxtpWPKpXyDfx2qPlvShKj+TYW5mMCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=;
	b=pw5KxHObGyXgFMq+SHz7n/5IYCXqyrf7MvoEQqZvk1I9O9S/SwTYzqgfOmXhtJPg3Gcw
	 Jl6dkhQy5eaY++oFLov9+XflA01zGRoprp+FAyhzZQnbTVRqdXyh2e4NLV/lVdKoQh4nc
	 g9RRXN1oXtdxmJxiOFZeK6KXjbHB6o1lKqkiBmpjk4UXkA99STNlZHPlc1MxRYYSpxGVS
	 TvDJDXx6Zf3leVOlv38xQuJKokedm9pevrIyUHxM7EPvikyavMbG2wlNzX+qpCj7uhEFT
	 UvwU4nQagCYdUHpyElZHrWLqWBAncew2YD9tfAcb9VRdoPv8Rg6waOGtahGUPujSYTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AsoYHNM1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O7+lWPAV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1853606A5A6
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1853606A5A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AsoYHNM1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O7+lWPAV
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dp9TB894134
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=; b=AsoYHNM1PRbrLXhs
	n0PfZm4CpkF4ME8cWSfYFh00O2Weh6QquG5y88C+fIFkVb2EFSY6hZXzbhxVQX8p
	lX3ei5ZV7Zj2GZblijdF32XPg/AL+IwWDev02eXJbhhAMlg7Z3w83YoGca6aqQR9
	jXBFFCgjoN+i4zDAjibV3acXztEBhXPEGyqA/8jTZCE7eIm85E72NI/ybIxa4BK5
	ra5JxX09emNPSXzfZ4To0dLcF78b65dS0qsjKKAhxduynYUQd2qB47ds+qzswYsM
	0qGJKlXqP/TOmvVKNMRdCuzbFdRQc2ntJ7oRGb4ibH0rvouMPCShwPpSQF3uS01V
	NiljXA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvsf66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:19:02 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-823d73ffca1so4686499a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:19:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632742; cv=none;
        d=google.com; s=arc-20260327;
        b=RXmxWCo11zL/VEHMgEEAAo+2KZnUTbo+31o3T4RTWvnBQcvUMqgMBLeUVjU8xTvnic
         PulbGYJ+mE3sllRtoXaVevWs6HSmg9aF4C3N7D6s4MRQGlqfBmxvrD+tnsOsHaE1zBh4
         LaPgwsHT/G9BJhm+vdpZPDB913r7JEhP49oIAaH/j/pTuy5fzAbwaZFjNBz4j9nnHaSj
         woW695z0aeOepcg87jcAwnWrG5+YsXOSdB9nuAlKEcnC+/XyR/zshJTqgYEr7oy+Lpxc
         3Y6ml0PAy4LI5+0OpU8vFgv3l46yK+35thGUv/q0t4NQ7KmXirOeB95OjsB9FnLHcbjU
         XDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=;
        fh=97AEyCcTYcYesHYTVikCNPlodlSPUv0V7ukO2FUEWHs=;
        b=ii5nrBGuXxBj1gB9epwVUrk9Hh/XUF0Yk7yhOnrdQxxCwmqUxExIvHTAwW7p9R9SQ8
         APAyu+cAfkCbkGBunWEcYhPHCLLL+M+Awmjn5eBknWFlj6WyHlTMIYZ53+4gBQ2kfvsV
         R2TvvPV37i5NmQz5AuZy/sJ/3ZXqc8+1GWaSiVV+rXfhn0NizarG/LggBUDm2YJOTH1O
         5sLCP3+ymytahzTi16TSCLMy/5ktPm0SWSbtQi40FTeIAnbFvzRoGxKsGobSAngGD8Dr
         /imDmA33VYnTd2qrZE3ad3fPE0WIN/yC3GkqgeRJjf9N87PX6Ig0sUilWDA2LLttlurC
         JihQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632742; x=1794237542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=;
        b=O7+lWPAVgxPy0p1RRDaAzo3lJUkNUkUe7E6v6d5BkRFXh9EThj4a+Ns013QUJzE1is
         tjQOIPg1ClqPZfXV4qQSVylbuQv6o+vAq2exby/HJD+gRZ9732vHIEooEnStrfSlpNhp
         jHhAzMTdDWus7BYEhda4irR0uDK5nFCyOlnt9Whxn4jl4h2BT3yTH90k0x0KqLO+L4NA
         8E96el5a97paftOUHrgvdwrna3MSGERCYYeBTmko7CSzE9b6Fc9z2VJGvUrKP3CP62Rn
         xPgipmRgjw4CbJTHaXZCDUuA3p04jE3lfwYHs+xPB1L66I1jN3VMRvaxdEBlJABNU2Kb
         x3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632742; x=1794237542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=;
        b=PByKT37uH4mVGqS64cXg6DujxTZa+tQ5Z6uSQP9LbVSLyIkg38+qtETtFtOk88hAqS
         R2o6mu+N94oVZalgG67KVKdks7/U+cbPg0ZnTu7yVvR+2GNN1/TLuDlF1fWt2gyBtRNZ
         k3N5cOHHFiPd9A0HaeDiT/TRqK6Tt3/DuXwwY43SHNxxAP30ABizOwI65MbDejbVDfK7
         yyFJa8suEFFDphruOmWxiW8GedMILlkDWCqos1e2UMTBPiD+i4LZLb5v/qpW5buhItCM
         dSMPwFeGMsfzdthXz6N0Ahf+VAdsxnzCufOLFFwpp5Jit4mXUoO9uz2AHCc2+vPAGdTm
         cMdw==
X-Forwarded-Encrypted: i=1; AKwUvBzkANhdtAIwSZ4c7k8ogOay5Z8LgaxRuWAj/VRi8N9MuOJ7lUpj6Yx/JxFjxFgtJly3u813UpulwFHBHVag@vger.kernel.org
X-Gm-Message-State: AFq9FYIPxd6Q2PTuGpssUUj4Fr4oQ91yJ8V5Z5ZJE1tttusYz5LUARrl
	YJ8jQxsXW4RDQzRvAsCTj76KgC08G3AUSiOSOSDD8+sxyt3mtQC/4X+c1P94+71XdfAEHC+NwSC
	AbV9z04JQJaDtnRSAN13bfec9K6X8HoxSausl4SLiW7O0c4KZnSUPOzlGxVNvE3DDY3E4tGkeiW
	yrCC5iNVXr2bWyBVeywGrq6S43+O1oY1PrSslls7miPEA=
X-Gm-Gg: AYBFou3lpcvbTxXAhvaS46OIorXT7SH7Gnv9WSVXZGYSQg2ndvJWzmv7FZ6EK8ePTyA
	q12RRQw+ArVxJ0odY1pXek4UjpYTbJ5YcgjDeoiejqIIQWstDB8GzaRL6h61YWNhj/vBNAvzo63
	aHB4VGuADGK0PfrEZio/MkgO+x9GlCEzK74c74fipDFt5kyhTeNvDJ9ZIdI+5rKhPTNFeYyFD0G
	P/iIwyd2O5fFetCOdjiSVbvulf9yUDVK0jKjG15sqgGIYqSLBeltvSqW0rlUjPGY8u7L0Gt/ktM
	RNlqZf3u4sMMI5yrnNaERbIzzj8u
X-Received: by 2002:a05:6809:8f:10b0:564:22ae:a6b6 with SMTP id 5614622812f47-56422aeacc9mr3332397b6e.41.1793632741892;
        Mon, 02 Nov 2026 07:19:01 -0800 (PST)
X-Received: by 2002:a05:6809:8f:10b0:564:22ae:a6b6 with SMTP id
 5614622812f47-56422aeacc9mr3332381b6e.41.1793632741440; Mon, 02 Nov 2026
 07:19:01 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-6-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-6-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:18:48 +0100
X-Gm-Features: AclHuK90Cnt49M0E3n-GEq5a7HYsx7101LK5oGlS_JqmbiqgXrkQ5xEgnXx0FJc
Message-ID: <CAFEp6-2-v3=wEixsWfu32qnqbQxyRL+N7_WbLRKerjuMsKjZ0Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] media: qcom: camss: csid-gen2: Enable RDI SOF tracking
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8a9e6 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Wf5Y_Iq7YOo0zHmYxc8A:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pbwIcbw8nYckzKTbJuIXYwzr5t6gqxSX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX10kvFqtoVu9i
 aMX/Q+vodV71hRq5bR3jGF3NZ/FxqaVJ99BSR5v/W2fzsKNu+NHgSGtBVY4gfSXCRmnUf/dRHo+
 SxI3ka1tjRp9m4N6Ppm+fSa/no7Eosw=
X-Proofpoint-ORIG-GUID: pbwIcbw8nYckzKTbJuIXYwzr5t6gqxSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX7ar5XYgmFHXf
 ch0CDGY2LehRhz9G2xtq9s7nWRBj/dgUjWGDgbTEbSedm/oQT7GiE1fpbESiteatrXEvo+YrgKx
 oWgIkjEW6m3huHCR3hH9XZerS1uHJqB8T8IoUmvfwVgVNXH/v6aWiXSnasNNWnHxUgha9gR/UlE
 hoyZl621OZGbeUrGtFYFBb2rsi5fJZ4CF/qzQPvaQy19NJqiiQNuxOE9yGQ9pqkzl/yGnAQD58P
 M3KgTtlGeYz+vasqCNPn+zBgwMeNDtt1Pi4y9160ffQb+qlNc03PyG0PC4PxxeIy56XttRboI/0
 Z34Wr1khLEADzH2vC393HRBsMT8M/9a+wpOmZGHloYHeV6oD+RlyodjBFsSOQZh2DJdYQGZTaZm
 saG57TKcVIe0TfMvUT9qM1Q0daFV8O+YTXM3wIQAAxKCEP7lpxgqW4xuP/tZJd7bLW7tljQz7cs
 f0kTldcpwht+cC7Civg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Add silicon specific changes to get SOF triggering V4L2_EVENT_FRAME_SYNC
> 'gen2' CSID. Covers SDM845, SDM670, SM6150, SM6350, SC7280, SC8280XP,
> SM8250.
>
> Tested thoroughly on sm8250 only for now. An additional patch is required
> in camss.c to enable this functionality on a per-SoC basis.
>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8250
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I guess we don't perform a read-modify-write on the IRQ mask here
because SOF is the only interrupt we're interested in.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f7e3aaa..a351ac4b91728 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -38,6 +38,8 @@
>  #define CSID_CSI2_RDIN_IRQ_SET(rdi)            ((csid_is_lite(csid) ? 0x=
3C : 0x4C) \
>                                                  + 0x10 * (rdi))
>
> +#define                RDIN_IRQ_INFO_INPUT_SOF         BIT(12)
> +
>  #define CSID_TOP_IRQ_STATUS    0x70
>  #define                TOP_IRQ_STATUS_RESET_DONE 0
>  #define CSID_TOP_IRQ_MASK      0x74
> @@ -322,6 +324,16 @@ static void __csid_configure_rdi_stream(struct csid_=
device *csid, u8 enable, u8
>         writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable=
, u8 rdi)
> +{
> +       u32 val =3D 0;
> +
> +       if (enable)
> +               val =3D RDIN_IRQ_INFO_INPUT_SOF;
> +
> +       writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +}
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         struct csid_testgen_config *tg =3D &csid->testgen;
> @@ -335,6 +347,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       __csid_configure_rdi_irq(csid, enable, i);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
> @@ -373,6 +386,8 @@ static irqreturn_t csid_isr(int irq, void *dev)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         val =3D readl_relaxed(csid->base + CSID_CSI2_RDIN=
_IRQ_STATUS(i));
>                         writel_relaxed(val, csid->base + CSID_CSI2_RDIN_I=
RQ_CLEAR(i));
> +                       if (val & RDIN_IRQ_INFO_INPUT_SOF)
> +                               csid_sof_event(csid, i);
>                 }
>
>         val =3D 1 << IRQ_CMD_CLEAR;
>
> --
> 2.56.0
>
