Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711DA41A918
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160620; cv=none; b=aUq5BFcFYgQPzYbA57V6bJxbo1Jrd+dDboAxPoVQb7kvhPuCQPYcMD+xQNX9s94ZFUgWwHXw5p8CvwohAKCYlWsHDba0GFIEmkxPV3xMC83/ZwqJbq1Inl9ml7JrNRAuFIUA18jFnsjfJitMP4cns3lpzDKponBa+GwldZkGDjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160620; c=relaxed/simple;
	bh=xzXkFRDFuYfIzShYV5bmDpRoDjvVcGLQ/TWibmFcswk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0bZ4TXshjYjE1oY8mNSE3/sbcu/dMlTErOhf0F3ebK9wHv4ekl0wtJAJjeMPdFoAX8lqICz9XoddRwq8Ny8WeIMBVZDNNl7ghVrXkB4MziHYFqnWDqfjTkNflVzbKg5SgIXh/Wgwk2RcDbwcfSFMmKmIa3+pupjVvgLzNuGLt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIsR+fhk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtWtDWJL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIsR+fhk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtWtDWJL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDm7Rb3664127
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2ecVVAzl7ah2+cxH73covTRhLHYFzycBQkVNDKcsK8=; b=TIsR+fhkLAqn97fF
	3IecO4D/HO3BvQd3p5sWczqTPYJ0GyVe+92uT6DGlSZFywt498eYslrWKqaJ9XNw
	UF1UVEjOPO3sDeAo0Viy8gXN847l1k6IRL6k+UNvBcO52KOHNK520w6PxM4bLaGZ
	rlSQYjo5uvOa7s4aB/+g0Hn/ufgqm8DFFwxGLD4hiu68PYpHzVWoI4Pqa0VP0GOA
	t17ZMFdNWnqwaygULCK2n6sPWNZXeEOl/qRggYUVlbcu4D/HK+clXMNlcNUGR9b9
	Gt6EDyICndO2DivW14Lg9oinuy4h8u0f3G3jqaBaR3BtZyKU0G/W5V83fG8h4LCG
	lrf0jQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp2ashqpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:56:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c069f73e4so2805651cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 06:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160618; x=1785765418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2ecVVAzl7ah2+cxH73covTRhLHYFzycBQkVNDKcsK8=;
        b=RtWtDWJLRaXl+MoxeEC2rFWfWk/HJV/X70aYZ77dU6pkk4c1tk2xa9Pi7sfNjgygi2
         MBHn3Z+DDRqicT5/enNW+E+9i2g63US5eDGUu6L7r9H554J92EjdbMhbInheW2NkM+Q6
         ALJSIEYUBUEHviDAih4JZUULBSKJx7iwv68nz78+wPvZhYXeHrc4bR/9bRe9+eD4bw7z
         H4zo/yXHTNIdiFdiAWVJyrTo6k00nqc+AuFKxST7jhwf5n6C2tiLiyZEfJ1KxulLoEoF
         9O8zzlj+SSM9Qer/iZDZ0RTVT5+dFnm4VIOklxATgj43o39tVSP6A6cjuQlR7h1K9hkl
         A+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160618; x=1785765418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2ecVVAzl7ah2+cxH73covTRhLHYFzycBQkVNDKcsK8=;
        b=A3Tp/1KOk1UrfahQ1hNCT3qHq9vWY4ziag3jDPoxJrd3/qIr3idAAUGSsSGRxNkaiX
         k7YeYiGU/YwW4ydC6lPIlxeTsSpPGWNAZDJbW9CwlTo+sFUfW4hz9T7KYzqCRIeFDEH+
         s90ETbC9Jk98UB0hqgsf/gS31mxK5HgpVphve1YvFrBA0xYZ5Il4FjyST/u0cpmSaTtr
         NIntm9pyxk5CTVU47CX5cG1MpsuoYih96TqXF40Yj8Ru4Fq44aUPC6aWNAqgi6bh/8Mm
         Wk6pycHbu2En72VrIRgVZrOYdS9NAdzFx0W0T0UgaHnVxZNbXC/uQjQ9KixVcvqPkzjM
         FqNA==
X-Gm-Message-State: AOJu0YwcYGsbgz42uIhga28Xux5FYaENh9rxWHCz4320sF91reTb7rrK
	AB+4BGWZcZ9B4PghdK/4yFOkQZUONSp3WJSmhl5yrEP9KmAuYkvQH1BnK2jYw6nl8MPCD14SEWm
	WO+gxKsfKXAI1kn7ickiqdImHmY2HIi3hUhbi1GdiPArs1iI5C0V1ifbcDAVp+gqcdiCX
X-Gm-Gg: AR+sD12nLQnfBy4LLG26hIzsRS9G2Ri8cFAWQ9ul3mxNt71MC9wihLt1zjLKrTPxYJq
	9bogM9be5naGcXTLQ0dP7+p31E7nJkWsMqMxucGPtM205i7dio3DdZjXJEQyLSD2V7T0Rvi2YLo
	/MEZs91FIiM88JFd9wuWrAfibXKz7cJf+DN1P8S5VfbNkUzzlumK5ILboX4QFz+dDIz8fQma4ZD
	Dvzo0Tq4DF20ZSp2j/a3c/7FL5vszdEr/ypGHg8xgrZ/bdFfjUN/d2WYDQdoQGLN06G3ApXGJOm
	ZbWp4BfJSjoLzSGtxynCWjDbJf8672sVUe3mX1yu6z02cL/76pXCqxxJAPNXd4BQnoqk9cMegfJ
	yCFwcUouF0kn6rqIr1//5C4Ml
X-Received: by 2002:ac8:5981:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-529a85f9b2emr122121641cf.5.1785160617504;
        Mon, 27 Jul 2026 06:56:57 -0700 (PDT)
X-Received: by 2002:ac8:5981:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-529a85f9b2emr122120981cf.5.1785160616824;
        Mon, 27 Jul 2026 06:56:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb50bcfdcsm2876913a12.3.2026.07.27.06.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 06:56:56 -0700 (PDT)
Message-ID: <3b0166c0-e1e7-4746-bcb9-ef78b9a86c8c@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 15:56:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-2-65c8469c6b65@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-glymur_linkmode_0724-v7-2-65c8469c6b65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX025/0/1iWras
 988mBecJBpbnT5+l8/anj8F/P2XL095TY6q1O9YkT5jR9LSUYCu8VLYqD+eXrA6MXMJMG2uOd5t
 Qto7NM/T6Phb7evdNBEiDpO8YfZpSX/cIGoCs8VXD4XtYykwzhErFmuUOKduD4DCmK5QnrNE7cD
 8vaUcVt1u6ZtKG2QIRI4K/1McpkxzFV2NAM5Eg0T6yVEemLVShS4hZfTRtkefCzCgGZ311oTzBc
 2uWceY9x/mZDdKAdVeEuGjBlcEbAlGK/g0OXGBViIO2zuMQ/fax083wzmXZZIlvA7AYde5n4OIV
 SYkKMpGD/R+kGZgHDzFmlKvbA+WjZE0rOnBGabIG+YBCMoRHSq3EbZmhQSZTVMCj5rxjNmi0Ywx
 eL3FsaPRwkeUI0xDjHR3WoGNucdNhw8sfFiJANBNBzSc1zmmix/idhmWuZGaHrgU11ZlueVZwru
 EJspwnX+qyOiZC6f3mw==
X-Authority-Analysis: v=2.4 cv=UPbt2ify c=1 sm=1 tr=0 ts=6a6763aa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fUhyWj0mt7oSvnhCvGYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfXxPezUAyez2NN
 e+cUefRKQPp77gm7sGAT+4ryIbzv+AdqkKWlV/dw5XqKNFvd3bmQBGkN3EFrGeN1+21ctcr2Gdr
 3tO5ScFN4D7RyAyZJxnlu32LyuMJK9M=
X-Proofpoint-ORIG-GUID: RBj1DY3vJRIpQUW2rl640g9xAlrTEU4x
X-Proofpoint-GUID: RBj1DY3vJRIpQUW2rl640g9xAlrTEU4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270133

On 7/24/26 12:01 PM, Qiang Yu wrote:
> Some QMP PCIe PHY hardware blocks support multiple link topologies (e.g.
> x8 or x4+x4) selected via a TCSR register. The existing single-instance
> QMP PCIe PHY driver has no way to model this: it assumes a single cfg per
> DT node and instantiates exactly one PHY.
> 
> Add a dedicated driver for this class of PHY. Match data carries a
> per-mode cfg table; qmp_pcie_multiphy_probe() reads the current link
> mode from the TCSR register pointed to by "qcom,link-mode", looks up the
> corresponding cfg array, and instantiates one qmp_pcie per sub-PHY
> required by that link mode, registering the clock and #phy-cells = <1> phy
> providers so consumers can address individual sub-PHYs by index.
> 
> The driver inherits the phy setting and link-mode programmed by firmware,
> so only the no_csr reset is used and no phy setting tables are provided.
> 
> Add the first match data and compatible, qcom,glymur-qmp-gen5x8-pcie-phy,
> for the Glymur Gen5 PCIe PHY that can bifurcate into two x4 links or
> operate as a single x8 link.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

This looks really good, couple of follow-up improvement suggestions

[...]

> +static const char * const glymur_pciephy_a_reg_l[] = {
> +	"port_a",
> +};
> +
> +static const char * const glymur_pciephy_b_reg_l[] = {
> +	"port_b",
> +};
> +
> +static const char * const glymur_pciephy_reg_l[] = {
> +	"port_a", "port_b",
> +};

I think we could construct these names at the call sites, with
essentially something like

for (i = 0; i < qmp->num_ports; i++) {
	sprintf(buf, "port_%c\n", 'a' + i);
}

(is that too cheesy?)

[...]

> +err_power_off:
> +	while (--i >= 0)
> +		pm_runtime_put(qmp->pd_devs[i]);

This probably can stay non-sync

> +
> +	return ret;
> +}
> +
> +static void qmp_pcie_pd_power_off(struct qmp_pcie *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	int i;
> +
> +	for (i = cfg->num_pds - 1; i >= 0; i--)
> +		pm_runtime_put(qmp->pd_devs[i]);

This should probably be _sync() as phy init/exit may be called in
quick succession

[...]

> +static int __phy_pipe_clk_register(struct device *dev, struct device_node *np,
> +				   int idx, struct clk_fixed_rate *fixed)
> +{
> +	struct clk_init_data init = { };
> +	int ret;
> +
> +	ret = of_property_read_string_index(np, "clock-output-names", idx,
> +					    &init.name);
> +	if (ret) {
> +		dev_err(dev, "%pOFn: No clock-output-names\n", np);
> +		return ret;
> +	}
> +
> +	init.ops = &clk_fixed_rate_ops;
> +
> +	if (!fixed->fixed_rate)
> +		fixed->fixed_rate = 125000000;

I think this always happens to be true in this driver

[...]

> +	num_pipe_outputs = of_property_count_strings(np, "clock-output-names");
> +	if (num_pipe_outputs < 0)
> +		num_pipe_outputs = 1;

This can't happen (clock-output-names is required via bindings)

[...]

> +static int qmp_pcie_read_link_mode(struct device *dev, unsigned int *link_mode)
> +{
> +	struct regmap *map;
> +	unsigned int args[1];
> +	int ret;
> +
> +	map = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,link-mode",
> +						   ARRAY_SIZE(args), args);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	ret = regmap_read(map, args[0], link_mode);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

ret = xxx()
if (ret)
	return ret;

return 0;

can be collapsed to simply return regmap_read()

with or without all that,

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

