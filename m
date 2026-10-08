Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3329B3A425B
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 16:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791476185; cv=pass; b=f2cMgb8jWuN6snQI//ryTkQSgyPRFE/dgYmINOyJ51kWosjobCUxcsCm6U2ESNSoJbTzPAM8OQdcgTPwwFjWY600S9m90SMx5ThhtaadXXd1wiT9kZmXaw4jPi071bFfUwZMH82ADbKwmpeIehIVKi3JUQEwSBFefgQ/Yg+mrok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791476185; c=relaxed/simple;
	bh=4UcVlB2cCLP3xE4Txh5cS77n0o3Nb1N17SI+OkKi1aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXnf2EwggLQP2OT/9fQp2PYM4e7HN9sLB2myjxhRpJ0goCL4HtAwLs6XmuEuoJW9fiSAUywi4Sa874s56eL2oze0CMSaWAbuCKBK+sUtEDXwepgeLUTK5zQUKUlvRUfwVEZ//tsJ497TRDf57RqXc5T/DehpVONb7oFfJFC28Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X41dZKE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrbHCcPx; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X41dZKE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrbHCcPx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVv7g3517971
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 16:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CbU0lJYZtBCXZZwP4Xw5k9X5fdFy/cckD1fKYuY3e1w=; b=X41dZKE7G56DEpSa
	3NlRUDTa1qAo0JFVgCkp0lF7n/jpX+F7TnteOLeg7azrxb9MGQ7hesWNTQ1Npg/x
	QnbJ1GBJ9EoWvrMhY8ydZ1OIhjUXG2fYKLbJ79v5W6eqBivh8NBowdADfsJKQoQE
	F9oO9P5tXGqvHns7ItdXHWfuf9gfn7ZCoK3O+m2u8s2q3YQiiJ6ZA38EhUR55Ci6
	apkO10GZlfKsEuj7jpKetPV3ZfnBZWoWHo1g6oCfjvM3vCFsgk1FdyQHFHH5+n1x
	/iaFS9cHunk0ApyydqWxorRl4gvWoCIQ/skxKHxuOHwRXdnIlE4lIKd8BvjJbLc2
	uA9Kag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe83mw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 16:16:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc359d9easo910933385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 09:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791476177; cv=none;
        d=google.com; s=arc-20260327;
        b=YhrrUp0gFLvG9qZY5us6Ij+3FknLa3hkMvl0TiKvgaLfPyTudAkG9Cr+q+eNtoNYHk
         druDLdC/D/t0ybaf0XjcRASHEJjpc3i/1xwAxfM0dOopIMahYRNAUeIsGIxCMZY8iIbH
         l1QSYDpC3kPge+IXa7PyMZS7gyQNkYNymMkqCJkZCf0W0RCu6rJmsXyrwo/aaM8I6ngc
         ca3SNXvWpw3i2xuc9/9ud3VG+t0yuvBOnNwYjNYNVcupMuaooAjGFA8e6waylONerafe
         4yr8X4iWxHry/3PSkkJzFPpG0WMByYlRRArH86H7uQWUg5H+FXpdl4IFriJ1+cNwD0uq
         paMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CbU0lJYZtBCXZZwP4Xw5k9X5fdFy/cckD1fKYuY3e1w=;
        fh=qHYM2O/yEOeVdvaDMFUbGbw5nR8HT1ERZr1UcRYzpOs=;
        b=HXbZYwP07alGYD2TRM04p9V1RQAwRSGhkZC6d9c/ssotI9vnZFJiLgNF5pE3kwqGEg
         oQnlzihnTfwW64hfeM2CxL7mNM1j8yoA8CLTDx7qtObg3k0HH+GVM1ulVozYFuuTHN+r
         4aiC8ref4E40InInzPrQM1AJuoF6Ci8zPO9ujNc/JT8UvPpPMuXgoSQgyK3UQbARhzal
         BvaTXbhJWc1i7Z4yCJMLNJGCK1oKjeEHmT70M9pakmJ+lkCzI48WSbSFgeFkpJgr46X3
         wBpyOj43wUKRQQt56A9uEUXvnOvWLaTH3OqaTEmrRad32Hm9VHKvqQvY7PVtU4coy4wI
         p80Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791476177; x=1792080977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CbU0lJYZtBCXZZwP4Xw5k9X5fdFy/cckD1fKYuY3e1w=;
        b=TrbHCcPxphClJtJOGJqXmo3wSDnSAJofBSuoIhHiZSKnSEfSRTaJhuUhjzsIvLifxp
         kwbND/NMvZ3JZH01xEfCN/3KSAAdrW7KFYI2xJJ3JOif9NkIWw3ij7R19ckLYeElpbwa
         bT/Bz8QcoYGRFZCtrmRyJ6Y9ys9JB77E+1gbiDlqE0D9Er9BkR6FpNvhKElMmgPpm/e8
         3hy+ED681LmerGdsdgxojtskzmCZuTAIqxe7DUGWiEpDAUsDsn/pQbrfLrwKkZOkyExv
         rz0yy3TE1KFPQLcc/rEvh+erKsiqqaR9+IVr80SbFuZ5o8C4GxfG4r3olFZUUs9/p+Tu
         wD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791476177; x=1792080977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbU0lJYZtBCXZZwP4Xw5k9X5fdFy/cckD1fKYuY3e1w=;
        b=HObWbx2FaZY/Eg2s5LCYqXx1gvAbEGZnx7N3QgTSo2uGzdesYHmQLw3JfOkxIhC8io
         o5XY5cjWPNLNWX2iyIqrr8H2gYX2D72/e78zMeEN8Zu2W4uWtq2VmPqTyUHrX7uoO494
         r8Vgq9JpDSsobylm71+cVNyojvq26owgdCyn3LafVxTVwyIcmw+c5HPxMuaRhfcVGHwM
         d964XChS6KhtsAZi0FhdaTqS229JgNxpd4ls6h3KJScZy4qR9I7O+fZtA/+5ndy8clB9
         vSpbo9818tIOz8SeVHZm0I1tbTA2MZ4/qhWjqhJshxoIrpVqoqCiyMLZ3vXIaHAxZO3k
         T/vg==
X-Forwarded-Encrypted: i=1; AKwUvByBwghZ+VmoToltbIHM6em4uPNcsKnq25QqbewEkr8BgfNPNtfJqO1hp/WbEBU8uAaUsuKKeojVTHDB4Ep3@vger.kernel.org
X-Gm-Message-State: AFuF++m+DH04gQbSW8AmcqPgRwY4sTgErFYD4+8e6JYsumv7yyFHz23L
	dSHSTcPNXFn7k2ROnJWmfbTB5vWQxt5GMqaZZGCv2Rn74pJwaXW1uZlc9kgw/OmQfV28hoddbFA
	JvNDFcA/0fsp7PXaOc/d9Gw8cXu+saLqlM69nlnY/w2W9finX9wlaltaK6M5k1VHCc69vESV63K
	yleNxjBOno/h03Aw9CV+NTEQ7eEtM1VHDRFgfUZpc/l4M=
X-Gm-Gg: AYBFou3KGB9digXQBSR6op83AYUWWa+blV2b9xTh7gK4RCAUTCIJHucpU+1maE0hIer
	ZmrkVFqZMk7MbIsRJiLtCgUVUN8CohsIyZqZzQZxsRlYuk9peLsqiugzkHo7wa28WE5Ec/1qyhE
	P+mttTkVHm/P2qjPgUz/qQSxDjKjyJD9XX4zuXhX6dRIEiQ9PBr/vVgAzqS6CzrDBoBojcr2baS
	1KCrbwQ0cIGBfOeDdXHCutr0yFnGr97fKxzJ5Fe2qoaKh+UbZnYEbaFddHivuORMgaRIDvEDw==
X-Received: by 2002:a05:620a:1b95:b0:93e:6ff1:b67c with SMTP id af79cd13be357-93e9b6fe9b5mr1129818685a.20.1791476176964;
        Thu, 08 Oct 2026 09:16:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1b95:b0:93e:6ff1:b67c with SMTP id
 af79cd13be357-93e9b6fe9b5mr1129807585a.20.1791476176220; Thu, 08 Oct 2026
 09:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com> <20261008-kaanapali-camss-v19-11-b2c583ef50e0@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-11-b2c583ef50e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 18:16:04 +0200
X-Gm-Features: AclHuK8xPX1fq2zZxMczsT41ze36xa1GC9o3axR6RZnV6IYgcR5yxVQaSUmjzvo
Message-ID: <CAFEp6-1Voqn3yFse5t82UOX7MVafkhL466BkEDSLVRH8OK132g@mail.gmail.com>
Subject: Re: [PATCH v19 11/12] arm64: dts: qcom: kaanapali: Add CCI controller nodes
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2NCBTYWx0ZWRfX0WNYkKAP3jtH
 orwocb8/gtOIA8cU+RxlMcJjywGfUgtowiMR9dcTTXHIGWVw8WmDEMUKMSiTjja3DJO4F+SgEqJ
 TLmBuJAV8/o7h5MnvFPhDssdALxWU0+LETqGKZWBDKpuwbnsBWzdfjxX3UlPO6bRPsU2WUvy8qg
 /uBEO5hTVe+k5mQ5QxeBUfzf+m/Y+0WWrg2khD4+6hrT10s+NEvg0UuEwbHqVFyjQU3/j8z7uv2
 BJtF254L40PfOobqLHRo/JbO7iXczK5ur5xuMXX+Xl3rIx/SLd1yJH35o2IpKsIu+NOS7fjwLdQ
 Vff3N5MAcU6g0zhHRNIld2UtqYfDSiQXU6JzOyd8k5mkjnxvuI87QDlD/5y/+9wy46oeZqdBrgN
 EuWXwER1sgHFhCALcXIOGteBjdIGEjX3uxznaThG5CnPO2ZWwLYiOyXkP+sZOwg664Ot9r1sRhx
 nR/xJLkzI0AJrpHV3Qg==
X-Proofpoint-GUID: Xx6G1DqPAKfCtits618cWrUSMh2yEEq_
X-Proofpoint-ORIG-GUID: Xx6G1DqPAKfCtits618cWrUSMh2yEEq_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2NCBTYWx0ZWRfXw/7s6q/UNIZy
 fn2kp5DiR0gWNn4S5MR35RcgcPOkqntT2WnIqHbJsKGIBjVptG3KDcgv3xekOaNR4q0jIqUbgSz
 MTsh5nRFIamOaFHLUQePfUAtS7iF97M=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac7c1d1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=fkeUGm9nBk2YKbx3A_4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080064

On Thu, Oct 8, 2026 at 9:14=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.
>
> The first bus has two CCI bus master pinouts:
> cci_i2c_sda0 =3D gpio109
> cci_i2c_scl0 =3D gpio110
>
> cci_i2c_sda1 =3D gpio111
> cci_i2c_scl1 =3D gpio112
>
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda3 =3D gpio113
> cci_i2c_scl3 =3D gpio114
>
> cci_i2c_sda4 =3D gpio107
> cci_i2c_scl4 =3D gpio160
>
> The third bus has two CCI bus master pinouts:
> cci_i2c_sda5 =3D gpio108
> cci_i2c_scl5 =3D gpio149
>
> cci_i2c_sda6 =3D gpio115
> cci_i2c_scl6 =3D gpio116
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 303 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 7e5106865e7e..710af0597aaa 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3749,6 +3749,117 @@ port@5 {
>                         };
>                 };
>
> +               cci0: cci@941b000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941b000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_0_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci0_i2c0_default &cci0_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci0_i2c0_sleep &cci0_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci0_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci0_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
> +               cci1: cci@941c000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941c000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_1_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci1_i2c0_default &cci1_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci1_i2c0_sleep &cci1_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci1_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci1_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
> +               cci2: cci@941d000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941d000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_2_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci2_i2c0_default &cci2_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci2_i2c0_sleep &cci2_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci2_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci2_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
>                 csiphy0: phy@9523000 {
>                         compatible =3D "qcom,kaanapali-csi2-phy";
>                         reg =3D <0x0 0x09523000 0x0 0x2000>;
> @@ -4459,6 +4570,198 @@ tlmm: pinctrl@f100000 {
>                         #interrupt-cells =3D <2>;
>                         wakeup-parent =3D <&pdc>;
>
> +                       cci0_i2c0_default: cci0-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;

A general comment on the CCI DTS patches: why are the pull-ups enabled
here (for SCL/SDA)? Do we expect boards to lack the external pull-ups
required by I=C2=B2C? If not, enabling the internal pull-ups seems
unnecessary. Also, what is their effective resistance on these
platforms? Aren't they typically too weak to meet the rise-time
requirements of most I=C2=B2C modes anyway?


> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci0_i2c1_default: cci0-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci0_i2c1_sleep: cci0-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_default: cci1-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_sleep: cci1-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_default: cci1-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_sleep: cci1-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_default: cci2-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_sleep: cci2-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_default: cci2-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_sleep: cci2-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
>                         hub_i2c0_data_clk: hub-i2c0-data-clk-state {
>                                 /* SDA, SCL */
>                                 pins =3D "gpio66", "gpio67";
>
> --
> 2.34.1
>
