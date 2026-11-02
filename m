Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600424;
	b=3SJzSJ1VroOaNoO+g4TgwKS68/cOt5yqZVNacF2ll162D/wQNbRWNOSuzIx29ZcbFNit
	 cYAzTbL/9J7En1ZnJrtA77YLTHH34b9N4ZG00llEaBuuen0pm3NAfthp3/xYHEorq6ihi
	 yYOtyZe/gogoW6luc4C8v6d3Ew6yz7lFG2QfIA9idPhJn6nIq/bjHmPeRzTQ+ht35n9be
	 YbjbBZutdKpaxv2OD+4VKGwwlD1me7wdF17Lk2Kz2dN7BfPcZv47IjzyVyVDGLQ9JXCjx
	 JxmG1zclwbfvboYliTYxFVxM9VEpPY/GyatlkgAcxo5/8vsXINbFcHmj3PL5p1OXS2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QyX8yX4CzN1DwOkTLY6yr6/ZZ29TdZPG6jl57zmJluU=;
	b=lJXccfUTCvfdP77GBsOUUn3Swc2EwPV6IKu7nF1cb7m6Kk4BNxebVPqh6NYI1LuzH+io
	 aPg4NFluD7GgtjDmdpm7uqXOdEk2hbbJdzrdYfaQh4qRn9wIQvxlNA5xodKxrL5I9NShK
	 NmSQnTJ0xFHgswdJN4ZWhRH+C1D7PC40Tum8YHzCAnIaUNapi8wFvGmUZTPempYmuQ+qj
	 O17fHgj7SkiU5o99Ss7EJd4CrYMZXTbvbqYjFaEZDCJ56aqwD0mpArLLGtAH58ci1bc5N
	 iLNXb/UA7O3YDnw/DqpW81tzGZZLKFZjyFan+cyhT+LDqdw/5gbXEIebf4DD62fauJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMCveOhy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JT9hHw6w;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C22606A332
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 06:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C22606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMCveOhy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JT9hHw6w
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24CcvR1811541
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 06:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QyX8yX4CzN1DwOkTLY6yr6/Z
	Z29TdZPG6jl57zmJluU=; b=XMCveOhySbHQCbLQSND56tN4utFgRq8djDpYJeqT
	AtV79aF6RSYfwq/5J5l3xuVwDYeWutcVbpkSk6Kd6th2JZDLr/ykaOut0PJ7mdrD
	20YPfeg9boLEkaZZtRV1hhLG5Df2pG9llNPtZlsa6swVtaBmHgRGcymTSESpeBOt
	MCHw6jwcJ5ZGxDkS/6xlDaHfEU/acFXgJuGECDxKm4jrtRvFuv115a2AhJybwp9q
	qoHQrNigsiZVr3MsLF231YBNLm/jyVkJ4AChNspg4GFFngoEiRYrRaNzNdhA/Swi
	OLR2ud4EPGTW6p0UDb1binu8FWePuULCbCMaDAe6DjUk6Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rgb3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:20:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso7363174eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 22:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793600423; x=1794205223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QyX8yX4CzN1DwOkTLY6yr6/ZZ29TdZPG6jl57zmJluU=;
        b=JT9hHw6wkM0EYCJzTej5rhOz9KiRv0tSaFSRJmRIO3ltgOAUJ+sVTFglk3kpRkcTYx
         Yw4JedDgJNOss0F+uEBPUK7lDksIEwQ9Y7kgOMYVd2YDrbU5PhmnrCqht0W6f7VoOB1d
         cQE3IqQUREoED47La+t4D0dU+0WRgQiAGFdVHgfJAaoGAIP+fLXpMpwm1IzeuXcS/s7e
         eTRpqVveEneb5frCtdCocyMmgNInZAaPXHVYYfcIt7JMDpwyhTtGPLCrtjdI2HDPzufq
         kP8cS98JsAJgXk8sNo2jfKH7Zd3a1Jb5MNQ+D8lsdH25hyyH2TG0sAckn1vTpxRFZRZ5
         QEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600423; x=1794205223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QyX8yX4CzN1DwOkTLY6yr6/ZZ29TdZPG6jl57zmJluU=;
        b=eY8yoHEsA9YZPNC2G0LW2TNPXyrm05CtdIwEeoqEPukJBJpymkyOVRG3tePUSg7ZjK
         KQsaZvl5FhZufxeBFTV775z6eR30RBgqWuKcMNDKDsA8NlP9D4Ij5o4MjuBPW9F20VQl
         2IzorVfNq66pX6HXezYZbjbuxd599/QOQsHtUVn6V8gK23T0/4qK0XIvDDc0yGy7sbQg
         GT9lXI0cfKt8sk17k12OxkFrjhyeJxfZlcF4Q9gpHoj6wBq36jm+uKQn3uU1au8SyNhm
         rhRVPxTCn11dWI8Rux8B07GxMfFPPwseeDF0NY/F3994Ec54htUEcP5BYBviNHJmC9JX
         8JcA==
X-Forwarded-Encrypted: i=1; AKwUvBwCG2s7y730tV1k8cIx8GrzV8tBMXbugE1h/6hTuh5Qf5jPUcbDAvu1iupGffmdp22U3OzOvK/QiKuj7URl@vger.kernel.org
X-Gm-Message-State: APuU4Z8SJpLIAIiTt+z2CH+jur4a3+v+MatIU8ESohCJHx2IgDlQ0+XT
	bKdqFf4XTvzlM9YQOFnkA6TD/a3h6/xbKFsNn9BoyThBKyjecsahpjQBkc3xmJomvoOJmJ6/jEt
	RESvkdZP/rXZ3iuWPITNWZJAEw1com9uf3xXNAkX/Zaji+ghzy7ZK5ncVgAstpHnnXMm7
X-Gm-Gg: AYBFou33mp/e/p+t1UcQPARP9bm/S0+RLwLNJLgiIGYoPVeIDHtPABK02ykWosdedNu
	6HZOl/RmGwys4ngEMA9KmEcfIVvt1Vm2gaBnCzl3nITvA9WOjt0DX1Z0TKvnwHervf/0xXspuo2
	gqx+EI0aWPh4mvieeRapUVXKAI6ru1wh5yDvKzEdAyxTvSlr4pGFEcR2nHd7xIIUcm3domin2IN
	aagPyVb7A9+Yqpi9eQxVURonRG1LmdSshCzNKlk1NvQWwgB9fZ1DXsi8xgmUG4Eg/Ct5RYKo+t2
	iPur5DntEZdLUpUJhcvTZIkVTLhfn7mUNPyNlvjQBwntD7ki5kqjqGSnEWhqn7vAiACxVkMugmy
	WeBHDmWTQhozRlhfzJ19jEI44lC2v0MJnLmSMJMd465cKyY6PESmumkL/FEIVb7Bc9N0JNR0fs5
	WDiGVEMiDqz0AvF5KX3qsA
X-Received: by 2002:a05:693c:65d2:b0:36a:532e:4abe with SMTP id 5a478bee46e88-36a532e4b6amr8102628eec.35.1793600422362;
        Sun, 01 Nov 2026 22:20:22 -0800 (PST)
X-Received: by 2002:a05:693c:65d2:b0:36a:532e:4abe with SMTP id 5a478bee46e88-36a532e4b6amr8102585eec.35.1793600421513;
        Sun, 01 Nov 2026 22:20:21 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a98f65sm32981227eec.28.2026.11.01.22.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:20:21 -0800 (PST)
Date: Sun, 1 Nov 2026 22:20:18 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/7] usb: dwc3: qcom: Support firmware-managed
 resource states for power management
Message-ID: <augrote-Sw3QO16d@hu-petche-lv.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <d04522f9f972637133b8b080919f870e56a66395.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d04522f9f972637133b8b080919f870e56a66395.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QiU06zEhIL_nbiPxzADLFgwiKGgoSiHS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNSBTYWx0ZWRfXxmrJ8xrQ3RNE
 Jzzpb5B0L5+uMsG8/YTJtpsJvbwH5MrxLiLRl9JiawfzkZe4TJ3SSRV6SChSn+ul+KRMPvuBA41
 /QFyS2oKxlWnygv4Og69Loyx917std8setZiOwWnRx9hITESEljwAdqSe6W1FQuuBmXIvoa5kjR
 rWbM4y5BWB/FmulZtnXRoK/kyXpRB1z974lZXNE8hvXK1dPiaybGhKkrJkKcAgTlj2I+unVrv6q
 RzuF4F/2IcdQr3OuZ39ipVM/FoQysedoT0X08lkxd7l0qhEM0LvC1nfaXw1YWRVt6XURswwqCxW
 S4V+eJMMT/hPkn8HwKkfnI0zgmXgVEqBz95EzsOqnDNY0BMaxvNVXTVir4LcClBAP6kdu0gN5zc
 vAG2k9Hm3XhL4E7l5hryh4N7XMKCCvBOfxWOjdHBzICbjKAqtuRlwgiBcXwgi8kTqIhbPYLNoqX
 PL8CvzK/L0wyrkU0SHw==
X-Proofpoint-GUID: QiU06zEhIL_nbiPxzADLFgwiKGgoSiHS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNSBTYWx0ZWRfX3FtrdoUJmuHb
 5uz3SIKwfuR2Ji1N1y/wnmEGe67DJ4E4NxJ8EnLt20oBxZ4rfkqkgWoCf8t6bXsc/fKrt8jMZOS
 ltLBN4Rqn/Oj8XrQ5t35uMx2EboF3eA=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae82ba7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=zr-Cv2bO-F6lnfCeg4YA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020025

On 26-10-29 00:29:36, Faisal Hassan wrote:
> Add support for firmware-managed resource handling in the Qualcomm
> DWC3 USB controller driver. On platforms such as SA8255P, controller
> resources are abstracted and managed collectively by firmware, and are
> exposed to Linux through SCMI-backed power domains.
> 
> On SA8255P, resources such as clocks, regulators, resets, TLMM and
> interconnects are controlled by firmware. The driver communicates with
> firmware through two power domains:
> 
>   - "power": controls power supply (GDSC) to the USB controller
>   - "bus": controls clocks and interconnects used for data transfer.
>     Register accesses through the controller require the "power"
>     domain to be enabled.
> 
> The two domains are voted on and off directly from the PM callbacks
> through dwc3_qcom_domains_get() and dwc3_qcom_domains_put(). Runtime
> PM usage counting keeps each domain enabled for as long as it is
> required; the driver does not attempt to track or infer any aggregate
> device power state, nor does it assume what state firmware or the
> bootloader left the domains in before probe.
> 
> Runtime suspend/resume vote only the "bus" domain, since the "power"
> domain must remain enabled for hardware accesses that can occur while
> runtime suspended. System suspend/resume vote both domains.
> 
> If system suspend is entered while the device is already runtime
> suspended, only the "power" vote is still held, so system suspend
> drops just that one. System resume then votes both domains back on,
> which keeps the votes balanced across the cycle.
> 
> The domains are attached with PD_FLAG_NO_DEV_LINK because runtime
> suspend and system suspend require different supplier states. Runtime
> suspend releases only the "bus" domain while retaining the "power"
> domain, whereas system suspend releases both domains. Ordinary
> device-links would couple both suppliers to the same consumer runtime
> PM state and therefore cannot express the required policy. The driver
> consequently manages the runtime PM references for the attached domains
> explicitly.
> 
> These votes are taken during probe, remove, suspend and resume,
> enabling coordinated management of grouped resources according to the
> controller's operational requirements.
> 
> Enable firmware-managed resource handling for the
> "qcom,sa8255p-dwc3" compatible while maintaining backward
> compatibility with existing platforms that use direct resource
> control.
> 
> pm_runtime_put_sync() drops the domain usage count even when it
> returns an error, so failures to vote a domain off are only reported.
> Failing suspend on them would leave the driver thinking the votes are
> still held and unbalance the next resume/suspend pair.
> 
> While here, assert the controller reset in dwc3_qcom_remove() and on
> the probe error-unwind path once the controller is powered down. These
> paths are shared by every qcom,snps-dwc3 platform, not only the
> firmware-managed ones added here. That is safe for existing platforms,
> because remove() already fully powers the controller down and a probe
> failure already leaves it unclocked.

Since you do controller reset for all platforms, would you please split this
patch for:

- Add controller reset for all qcom platforms
- Add firmware-based resource management for auto SoCs

>  
> +/*
> + * Firmware-managed resource handling
> + *
> + * On platforms where clocks, interconnects, resets and the GDSC for the USB
> + * controller are owned and sequenced by firmware, access to those resources
> + * is exposed to Linux as two power domains:
> + * - pd_list->pd_devs[0] ("power"): the GDSC supplying the controller
> + * - pd_list->pd_devs[1] ("bus"): the clocks and interconnects used for data
> + *   transfer, which additionally require "power" to be on for register
> + *   accesses to succeed
> + *
> + * The two domains are voted on/off directly from each PM callback that needs
> + * them; there's no attempt to track or name an aggregate device power state,
> + * since the actual state lives in firmware and is queried by voting through
> + * runtime PM, not by mirroring it in the driver.
> + */
> +
> +/**
> + * dwc3_qcom_domain_detach() - Detach power domains
> + * @qcom: Pointer to the dwc3_qcom structure
> + *
> + * Detaches all power domains.
> + */
> +static void dwc3_qcom_domain_detach(struct dwc3_qcom *qcom)
> +{
> +	if (qcom->pd_list)
> +		dev_pm_domain_detach_list(qcom->pd_list);
> +}
> +
> +/**
> + * dwc3_qcom_domain_attach() - Attach power domains
> + * @qcom: Pointer to the dwc3_qcom structure
> + *
> + * Attaches power domains for firmware managed resource handling.
> + * Returns 0 on success, negative error code on failure.
> + */
> +static int dwc3_qcom_domain_attach(struct dwc3_qcom *qcom)
> +{
> +	struct dev_pm_domain_attach_data pd_data = {
> +		.pd_flags	= PD_FLAG_NO_DEV_LINK,
> +		.pd_names	= (const char*[]) { "power", "bus" },
> +		.num_pd_names	= 2,
> +	};
> +	struct device *dev = qcom->dev;
> +	int ret;
> +
> +	ret = dev_pm_domain_attach_list(dev, &pd_data, &qcom->pd_list);

Using devm_pm_domain_attach_list, the dwc3_qcom_domain_detach is not needed
any more.

> +	if (ret != pd_data.num_pd_names) {
> +		dev_err(dev, "domain attach failed (%d)\n", ret);
> +		return ret < 0 ? ret : -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * dwc3_qcom_domains_get() - Vote the firmware-managed domains on
> + * @qcom: Pointer to the dwc3_qcom structure
> + * @bus_only: If true, leave the power domain untouched and only vote bus
> + *
> + * Votes runtime PM "on" for the domains this call is responsible for. Each
> + * call has exactly one matching dwc3_qcom_domains_put() call with the same
> + * @bus_only value on the corresponding disable path; runtime PM's own usage
> + * counting is what keeps power on for as long as bus needs it, without the
> + * driver tracking or assuming any prior domain state itself.
> + * Returns 0 on success, negative error code on failure.
> + */
> +static int dwc3_qcom_domains_get(struct dwc3_qcom *qcom, bool bus_only)
> +{
> +	struct device *power_dev = qcom->pd_list->pd_devs[0];
> +	struct device *bus_dev = qcom->pd_list->pd_devs[1];
> +	int ret;
> +
> +	if (!bus_only) {
> +		ret = pm_runtime_resume_and_get(power_dev);
> +		if (ret) {
> +			dev_err(qcom->dev, "failed to enable power domain: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = pm_runtime_resume_and_get(bus_dev);
> +	if (ret) {
> +		dev_err(qcom->dev, "failed to enable bus domain: %d\n", ret);
> +		if (!bus_only)
> +			pm_runtime_put_sync(power_dev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * dwc3_qcom_domains_put() - Vote the firmware-managed domains off
> + * @qcom: Pointer to the dwc3_qcom structure
> + * @bus_only: If true, leave the power domain untouched and only vote bus
> + *
> + * Releases the votes taken by the matching dwc3_qcom_domains_get() call.
> + * Bus is released before power since bus register accesses require power
> + * to still be on.
> + *
> + * pm_runtime_put_sync() drops the usage count even when it returns an error,
> + * so the votes are released regardless and errors are only reported. Treating
> + * them as failures would make callers believe the votes are still held and
> + * unbalance the next dwc3_qcom_domains_get()/put() pair.
> + */
> +static void dwc3_qcom_domains_put(struct dwc3_qcom *qcom, bool bus_only)
> +{
> +	struct device *power_dev = qcom->pd_list->pd_devs[0];
> +	struct device *bus_dev = qcom->pd_list->pd_devs[1];
> +	int ret;
> +
> +	ret = pm_runtime_put_sync(bus_dev);
> +	if (ret < 0)
> +		dev_warn(qcom->dev, "failed to disable bus domain: %d\n", ret);
> +
> +	if (bus_only)
> +		return;
> +
> +	ret = pm_runtime_put_sync(power_dev);
> +	if (ret < 0)
> +		dev_warn(qcom->dev, "failed to disable power domain: %d\n", ret);
> +}
> +
>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
>  {
>  	u32 reg;
> @@ -380,8 +510,20 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>  	int i, ret;
>  	bool wakeup;
>  
> -	if (qcom->is_suspended)
> +	if (qcom->is_suspended) {
> +		/*
> +		 * Runtime suspend dropped only the bus domain. System suspend
> +		 * must drop the power domain too, so that system resume, which
> +		 * votes both domains back on, stays balanced. The usage count
> +		 * is dropped even if this fails, so don't fail the suspend.
> +		 */
> +		if (qcom->fw_managed && !PMSG_IS_AUTO(msg)) {
> +			ret = pm_runtime_put_sync(qcom->pd_list->pd_devs[0]);
> +			if (ret < 0)
> +				dev_warn(qcom->dev, "failed to disable power domain: %d\n", ret);
> +		}
>  		return 0;
> +	}
>  
>  	/*
>  	 * For runtime suspend, always enable wakeup.
> @@ -397,11 +539,17 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>  		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
>  			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
>  	}
> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  
> -	ret = dwc3_qcom_interconnect_disable(qcom);
> -	if (ret)
> -		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
> +	if (!qcom->fw_managed) {
> +		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> +
> +		ret = dwc3_qcom_interconnect_disable(qcom);
> +		if (ret)
> +			dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
> +	} else {
> +		/* Runtime suspend keeps power voted on; system suspend drops both. */
> +		dwc3_qcom_domains_put(qcom, PMSG_IS_AUTO(msg));
> +	}
>  
>  	/*
>  	 * The role is stable during suspend as role switching is done from a
> @@ -456,13 +604,22 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  	 */
>  	dwc3_qcom_disable_interrupts(qcom);
>  
> -	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
> -	if (ret < 0)
> -		return ret;
> +	if (!qcom->fw_managed) {
> +		ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
> +		if (ret < 0)
> +			return ret;
>  
> -	ret = dwc3_qcom_interconnect_enable(qcom);
> -	if (ret)
> -		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
> +		ret = dwc3_qcom_interconnect_enable(qcom);
> +		if (ret)
> +			dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
> +	} else {
> +		/* Runtime resume re-votes bus only; system resume votes both. */
> +		ret = dwc3_qcom_domains_get(qcom, PMSG_IS_AUTO(msg));
> +		if (ret) {
> +			dev_err(qcom->dev, "failed to enable power domains: %d\n", ret);
> +			return ret;
> +		}
> +	}
>  
>  	/* Clear existing events from PHY related to L2 in/out */
>  	for (i = 0; i < qcom->num_ports; i++) {
> @@ -699,16 +856,21 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (priv_data)
>  		qcom->broken_suspend = priv_data->broken_suspend;
>  
> +	if (priv_data && priv_data->fw_managed)
> +		qcom->fw_managed = priv_data->fw_managed;
> +
>  	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
>  	if (IS_ERR(qcom->resets)) {
>  		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
>  				     "failed to get resets\n");
>  	}
>  
> -	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
> -	if (ret < 0)
> -		return dev_err_probe(dev, ret, "failed to get clocks\n");
> -	qcom->num_clocks = ret;
> +	if (!qcom->fw_managed) {
> +		ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "failed to get clocks\n");
> +		qcom->num_clocks = ret;
> +	}
>  
>  	ret = reset_control_assert(qcom->resets);
>  	if (ret) {
> @@ -724,9 +886,33 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
> -	if (ret < 0)
> -		return ret;
> +	if (!qcom->fw_managed) {
> +		ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
> +		if (ret < 0) {
> +			reset_control_assert(qcom->resets);
> +			return ret;
> +		}
> +	} else {
> +		ret = dwc3_qcom_domain_attach(qcom);
> +		if (ret) {
> +			dev_err(dev, "Failed to attach domains (%d).\n", ret);
> +			reset_control_assert(qcom->resets);
> +			return ret;
> +		}
> +
> +		/*
> +		 * pm_runtime_resume_and_get() is correct here regardless of
> +		 * whatever state firmware or the bootloader left the domains
> +		 * in beforehand.
> +		 */
> +		ret = dwc3_qcom_domains_get(qcom, false /* bus_only */);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable power domains (%d)\n", ret);
> +			dwc3_qcom_domain_detach(qcom);
> +			reset_control_assert(qcom->resets);
> +			return ret;
> +		}
> +	}
>  
>  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!r) {
> @@ -790,9 +976,11 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		goto clk_disable;
>  	}
>  
> -	ret = dwc3_qcom_interconnect_init(qcom);
> -	if (ret)
> -		goto remove_core;
> +	if (!qcom->fw_managed) {
> +		ret = dwc3_qcom_interconnect_init(qcom);
> +		if (ret)
> +			goto remove_core;
> +	}
>  
>  	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
>  	device_init_wakeup(&pdev->dev, wakeup_source);
> @@ -804,7 +992,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  remove_core:
>  	dwc3_core_remove(&qcom->dwc);
>  clk_disable:
> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> +	if (!qcom->fw_managed) {
> +		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> +	} else {
> +		dwc3_qcom_domains_put(qcom, false /* bus_only */);
> +		dwc3_qcom_domain_detach(qcom);
> +	}
> +
> +	reset_control_assert(qcom->resets);
>  
>  	return ret;
>  }
> @@ -817,9 +1012,18 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>  	if (pm_runtime_resume_and_get(qcom->dev) < 0)
>  		return;
>  
> +	/* Also disables runtime PM and marks the device suspended. */
>  	dwc3_core_remove(&qcom->dwc);
> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> -	dwc3_qcom_interconnect_exit(qcom);
> +
> +	if (!qcom->fw_managed) {
> +		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> +		dwc3_qcom_interconnect_exit(qcom);
> +	} else {
> +		dwc3_qcom_domains_put(qcom, false /* bus_only */);
> +		dwc3_qcom_domain_detach(qcom);
> +	}
> +
> +	reset_control_assert(qcom->resets);
>  
>  	pm_runtime_put_noidle(qcom->dev);
>  }

There are so many judgements for qcom->fw_managed during the main flow, since
there are only resource management difference, is it possible hide the differences
for the main flow, and add some qcom USB resource APIs for them, eg:

static void dwc3_qcom_clk_disable(struct dwc3_qcom *qcom, bool bus_only)
{
	if (!qcom->fw_managed)
		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
	else
		dwc3_qcom_domains_put(qcom, is_all);
}

For calling dwc3_qcom_interconnect_init(qcom), if it is fw_managed, just boil out. 

-- 

Thanks,
Peter Chen
