Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8D23EDAA3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403099; cv=none; b=ku9k/ACRbXkuF5vVX4Ptmxe6dfRNWdrMhB8sxgRMji77WP7VrPqAKvvZ1P3CcKcCIFm4xhmFu95cDrnXRQCwuW1ukAenOXcJiSZ+7QVhmg4uT3vSeRVzyRS/T6gVzRlNXP9M5IuDfxR7sMIo/EJ3VEf3Y/xVUxnZKt/+Ij7ZQQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403099; c=relaxed/simple;
	bh=J3fl//mqSV8IcvXoBQv5UDQvckPuvtYXyIMtKx+eDVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NivHIVFO6cOOfUfTys6+7dJ3yDRYj2yBLbFImoTA+g1lwfwUUFJTHnOz6clw/PmwRWmJtfLhLXCQcL2uS8S7YoskarHy0U6hx0jwaumTXOiLH9doOVm+0effM6XgM8b4kMUIGx+ELVwIngZmXG4+g8of00Fmk+Mw9ZHniunlW7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCM0Lqgo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWFH//89; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCM0Lqgo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWFH//89"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8sX4H1504572
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m7D6CIAxG2VxuD/7lWVUh+sF
	Bcex9ieNa67C58ZvSVk=; b=LCM0Lqgo/VO/dh0bjt9RRFxsJInm3cQkhuUvlf8/
	i9NuLZu5lWLbCn9MCvhBsjqdZ+rK6aovyJFylIEYvT/j9pZ9kqNa7ofq44P/XTH2
	+9nu6bwd/3gFENAC9IGtt3ejxJCd3Iv+sktjlw3YVEwzqtOBQcuBzV+Dj3rWLxvd
	FgNH7B6W/uM4Hd6tS7St7sGK+Jijw4L3RVhbVBl7SYMOIKXrzB+EgOfvGX0HtxPH
	lSVCdHg4C0gxMIo5lC+aA06HYQjV2Y6rfuLgEWAinvJFCev/UQeFIwDG0FxMe6a+
	nJsQ+xguY6LLwYQ0VTjN6Rmv26rwladL0LwW4+5pVhxiSw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3h1r43q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:18:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso36899415ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403096; x=1786007896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m7D6CIAxG2VxuD/7lWVUh+sFBcex9ieNa67C58ZvSVk=;
        b=PWFH//89JNGAUVYhKwaNjITZV0ByxDqdnY0Lj4m2a0xptrS52F7N37RXl0irQ70vEz
         AZMg1kAwkQL7+3aEyb4gHOCIrhMu0jQeh5hD2QirpORCm5khUVTraIGkV/z9OPsJ4M9p
         5/f340HjmLmyaWmwfa9XT21q7Ei/fAg1osTtLV2dUIGGz4So9dSQDqT4y8pQO2hig02e
         dkuOWP7sXlflG26SZ5ievfAUYj+l+9X4D3ZpTcZhJqZS1Oj0U2IzThOiV6bAZiHaTf/T
         mOjPL0KNbu+cGOOlHdgWoOw8/xjHGvLnajM9gNhBXgdnNLJn6htUdazFj8+Zsv2lSE/f
         iveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403096; x=1786007896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7D6CIAxG2VxuD/7lWVUh+sFBcex9ieNa67C58ZvSVk=;
        b=E94gELMy3CJ5R+Ou1MjvpAjIvSTVHZBr1xSe/LL8JPNC2TVk6e719F1tYD7ya3QGjB
         3IuQl76g3Mhlim0VnXERNGKagdZOB25dRRo8we222n4ZzurNzha7rKa/e50MLm8GAbXd
         NSsVkhxP14upWHZPsxJBNxPup2TnxbMlloFjDYVxKNlA7/wuIxsSvCr/7GpGTqJz9Krz
         //5iWAwJsWLulSJ5oHSSkICPj4g5w7u1c9NMNvj0RnKRK89U2LiL38j4B3mKXgjS+A57
         mXS/2lDThfocewuD67nXqurcLc9I7tptltrgZitDZcomF54VtkwF26SSuzv44NZRukrn
         CBmw==
X-Forwarded-Encrypted: i=1; AHgh+RrpXfScIZ/DLSZDRWLxhZVzPVqmYnqHLQDEn2Sd7kT30a/XVOZ7PbRgZxvSoXg3ZaFprKBU5V8pfguC7I2o@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp37gm76LtetNvEhn5OJuC+0GGQoKR2aKxa0BycljsePugtpW8
	mByrrvbp8eqZGr4SstgUiVGLyXfLaylgZZ5N9nfDIY4Fu4EytfVdZYhlmmuWG5VgA0cQm0IS/CO
	G8f0ulMeaDuRz4iUKvkhv0KNat2mvbCHLkcQIfPy8WFc3phZ02U+Hv3ZpiX3jXu+MJF0b
X-Gm-Gg: AR+sD101Xji3YVlVkuULmH2agP/TbwP02Bi7YjbPgYrWmpTdCmlTqXnJOGrdjDeUxnm
	x3sNI70/nmZRcNkPW0V1ixWeYJ0gIKplUjNGTrLACBnVNybDRe6N5kFKQBmVtFdWUae5QR4veu2
	lrPwNRRo8lEfVgT+mIqiDNBtUE/5k42XbfbEsd11XLNkky6p4Z8GL8FMaZCw2AVxB7j3idLBacH
	sorkXkuuaVJ715lzf7YHCjRlml+qOBn3Kid+maAQQCuzSlZvCHP84D8qAJtwH1+BvEylQ4dxBtu
	3cjlv4baULC/OagDbiOBGwWNcZ3Hvw2i//qN2reisLeWYA/bkqxX3568v5/qEhnS8R0jem7WOQL
	gKwid0ayiFXepvcQ1+n3bgEdAenUWuF3JtMrdCrVeYNazjC0=
X-Received: by 2002:a17:902:ecc5:b0:2cf:ca89:4990 with SMTP id d9443c01a7336-2d035be854cmr19137925ad.17.1785403096175;
        Thu, 30 Jul 2026 02:18:16 -0700 (PDT)
X-Received: by 2002:a17:902:ecc5:b0:2cf:ca89:4990 with SMTP id d9443c01a7336-2d035be854cmr19137645ad.17.1785403095691;
        Thu, 30 Jul 2026 02:18:15 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc6d70sm23702795ad.39.2026.07.30.02.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:18:15 -0700 (PDT)
Date: Thu, 30 Jul 2026 02:18:12 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v7 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
Message-ID: <amsW1Efw7vXDqLrw@hu-qianyu-lv.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-2-65c8469c6b65@oss.qualcomm.com>
 <3b0166c0-e1e7-4746-bcb9-ef78b9a86c8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b0166c0-e1e7-4746-bcb9-ef78b9a86c8c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: qYdhSy86oubfegWbhumQOn1E2CVB3A4n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OCBTYWx0ZWRfXwFN1ntMInbF2
 c1rr//UpJfsHUuCCVvDTjDYMzlnUtm6qB3HOPdu57ml8KeZlmUiOuqb9envDYPNKK2OL22N78Bw
 W/G39YLglo5AiMiVAtXa3jQaG9glul3DUNlUSQy+oXUrWWh76kemwAgjJtgn7CSPnDFD8zG2mIg
 8yoESy6otYV2ykrwfUK3qeDhh6Ef/QyVostOf0S+kU3izRML/GYY1Mxt6hVLHx2bxec4/IzLUVS
 v/gCLZe0KGIwaqW/B7lNOl1QU17yYRhMwzWvlk0jSo6G09mOkaBL3ovmOrS2vkgnvp/UQ1897QX
 RE6wvV6srLD/U/qUuXXVzipMLN/P9T0fu/s5sgoOCqI4fKtMfVfXCWLxm8YYXDG1E+UrMtmntb2
 3fSXSr3k0Thub/SalWbhKeOOFq6edIiTMGXE2rGu1lCwasghPbd8eQ0YKF98lLvg/17BV8aFvxB
 TqfSz2WEayT79A79lbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OCBTYWx0ZWRfXxNvc4/VcYQfb
 VtU8L27rEySgpvMwDPmGLUrLxOXxv7fajaAUwBc7fIDS/AjB41wUKFsUWObPsl4kCeXgyQ8jISm
 FZGHw8z7vX/+y8HjUrTt+ZS3lg82i3Y=
X-Proofpoint-GUID: qYdhSy86oubfegWbhumQOn1E2CVB3A4n
X-Authority-Analysis: v=2.4 cv=K/QS2SWI c=1 sm=1 tr=0 ts=6a6b16d8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B5iJy24gySRdRLL-o9UA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300068

On Mon, Jul 27, 2026 at 03:56:53PM +0200, Konrad Dybcio wrote:
> On 7/24/26 12:01 PM, Qiang Yu wrote:
> > Some QMP PCIe PHY hardware blocks support multiple link topologies (e.g.
> > x8 or x4+x4) selected via a TCSR register. The existing single-instance
> > QMP PCIe PHY driver has no way to model this: it assumes a single cfg per
> > DT node and instantiates exactly one PHY.
> > 
> > Add a dedicated driver for this class of PHY. Match data carries a
> > per-mode cfg table; qmp_pcie_multiphy_probe() reads the current link
> > mode from the TCSR register pointed to by "qcom,link-mode", looks up the
> > corresponding cfg array, and instantiates one qmp_pcie per sub-PHY
> > required by that link mode, registering the clock and #phy-cells = <1> phy
> > providers so consumers can address individual sub-PHYs by index.
> > 
> > The driver inherits the phy setting and link-mode programmed by firmware,
> > so only the no_csr reset is used and no phy setting tables are provided.
> > 
> > Add the first match data and compatible, qcom,glymur-qmp-gen5x8-pcie-phy,
> > for the Glymur Gen5 PCIe PHY that can bifurcate into two x4 links or
> > operate as a single x8 link.
> > 
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> This looks really good, couple of follow-up improvement suggestions
> 
> [...]
> 
> > +static const char * const glymur_pciephy_a_reg_l[] = {
> > +	"port_a",
> > +};
> > +
> > +static const char * const glymur_pciephy_b_reg_l[] = {
> > +	"port_b",
> > +};
> > +
> > +static const char * const glymur_pciephy_reg_l[] = {
> > +	"port_a", "port_b",
> > +};
> 
> I think we could construct these names at the call sites, with
> essentially something like
> 
> for (i = 0; i < qmp->num_ports; i++) {
> 	sprintf(buf, "port_%c\n", 'a' + i);
> }
> 
> (is that too cheesy?)
> 
> [...]
> 
> > +err_power_off:
> > +	while (--i >= 0)
> > +		pm_runtime_put(qmp->pd_devs[i]);
> 
> This probably can stay non-sync
> 
> > +
> > +	return ret;
> > +}
> > +
> > +static void qmp_pcie_pd_power_off(struct qmp_pcie *qmp)
> > +{
> > +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > +	int i;
> > +
> > +	for (i = cfg->num_pds - 1; i >= 0; i--)
> > +		pm_runtime_put(qmp->pd_devs[i]);
> 
> This should probably be _sync() as phy init/exit may be called in
> quick succession

I'd prefer to keep the async put here. The generic PHY core does the same
in phy_power_off() (phy_pm_runtime_put() -> pm_runtime_put()), and the
async behaviour is actually what helps the quick init/exit case: the
idle/suspend request queued by pm_runtime_put() gets cancelled by the
following pm_runtime_resume_and_get in rpm_resume() before the worker
runs, so the power domain doesn't actually toggle. With _sync() the exit
would drop the domain immediately and a closely following init would have
to power it back up again.

- Qiang Yu
> 
> [...]
> 
> > +static int __phy_pipe_clk_register(struct device *dev, struct device_node *np,
> > +				   int idx, struct clk_fixed_rate *fixed)
> > +{
> > +	struct clk_init_data init = { };
> > +	int ret;
> > +
> > +	ret = of_property_read_string_index(np, "clock-output-names", idx,
> > +					    &init.name);
> > +	if (ret) {
> > +		dev_err(dev, "%pOFn: No clock-output-names\n", np);
> > +		return ret;
> > +	}
> > +
> > +	init.ops = &clk_fixed_rate_ops;
> > +
> > +	if (!fixed->fixed_rate)
> > +		fixed->fixed_rate = 125000000;
> 
> I think this always happens to be true in this driver
> 
> [...]
> 
> > +	num_pipe_outputs = of_property_count_strings(np, "clock-output-names");
> > +	if (num_pipe_outputs < 0)
> > +		num_pipe_outputs = 1;
> 
> This can't happen (clock-output-names is required via bindings)
> 
> [...]
> 
> > +static int qmp_pcie_read_link_mode(struct device *dev, unsigned int *link_mode)
> > +{
> > +	struct regmap *map;
> > +	unsigned int args[1];
> > +	int ret;
> > +
> > +	map = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,link-mode",
> > +						   ARRAY_SIZE(args), args);
> > +	if (IS_ERR(map))
> > +		return PTR_ERR(map);
> > +
> > +	ret = regmap_read(map, args[0], link_mode);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> 
> ret = xxx()
> if (ret)
> 	return ret;
> 
> return 0;
> 
> can be collapsed to simply return regmap_read()
> 
> with or without all that,
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 
