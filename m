Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449231;
	b=4c49mFOvBr0WS2AJRPfJ9u5E5piAkMGdZBtwMDEO9NppFcD1oIZe8QFBzB8CcMYOUhDM
	 OJTxBz3a1IngxADDz1KhE+OTVylivXCtbSfdK2FqjZMU0iNhfRPWvOv0sugEa8sAmJBZ5
	 QuJBEtiWx9QkilxkzEZO3qFcPkHfVAVG14u/ZGA9FSA0ieBZ/mpJGkkta0lFNAP+ytCKp
	 hcVQVRhvDFoMTiEJUxSLiTpss6Ktsuhz9hEwsRFwzSaXNGNKUx7reNwoI4baG+tVzB4SN
	 u0gp6qBxmmjYVqN3AM72ov2FhEJRQc82LgafQzOiPOHhcwZOwoXX96/xvLHFllp3/OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O6eml6/KMAyx4GGG3XewIb3LC5ArF6kRUP9Bc5QWjbI=;
	b=Spg/UKvuxu3Ck+NXDGO2CtMVMOTFJmtO/Um6zg000miY0p36snMpM/ykq53qu5w/T8m6
	 Q/PazqPpn7q5PdgbvaFrRqGdakHtmucyzo6kcgXu0npYuSYmu7icpZ2j8n0vxjdZUd8b+
	 SANvyHx9DSWnMWGkm3EECMm5wasF67pasVRNxm3Ieo8+RhfXmfojDuFEQoSF0FT7nmNe9
	 4A0P0FhSk0GF/1DdzzsuAF3ZdgVgKp6kWSewU3RxrX/1QhttR7zGXcL49y2YPVzw3JY2X
	 6CDT9rguWNnyW1wn9DChodKQHENXSVlWDQKbd6q+ASUf3YIbkZ2q0fl1QI/ubLtHyew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgZdjNhW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LGaL3DeU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC009606A333
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 12:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC009606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgZdjNhW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LGaL3DeU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4aAEC595371
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 12:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O6eml6/KMAyx4GGG3XewIb3L
	C5ArF6kRUP9Bc5QWjbI=; b=KgZdjNhWbZo4YRTv4iA6OSTSK+Hl7xydAMw1sU7z
	r3D5AjRQczY2dV8AD/cp4PGNTlxdYPZ5HGs7qpM6olkd5XV/jHU1hKNUZnjFGfLC
	Au1kRb2U6a+drRG0dM22vuLHXzXzsG24b2dTTv0LkIYOLdbqhaST/09XG616fklb
	KhmqQANvVixgRhkiAt4+T3pSogQTTLAw9MMBlrkJAjs7+pF1rINmQLebnn+j9tZZ
	Oa/+qlka5BBoGxexI3VZ6QogFMb3na67VK1pVq3U/pFfay2qZ0OwkJdYeO2g6Uq4
	qfHaSiuSHlCjeSWt/qOpfRL86JbzCSrrpGHW4CPEqC6jqg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93egy8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 12:20:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so2302736eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 05:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793449224; x=1794054024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O6eml6/KMAyx4GGG3XewIb3LC5ArF6kRUP9Bc5QWjbI=;
        b=LGaL3DeUj5yf2AAtf3+90TY0kCwS7+KrYE7NklMXjTD/LlKB80jUrVguJrPsguI9Q0
         FhEHpR1p8umrXvjxnxByXP9BoeW085fTslBvHvIvM6yKYvAcMvF4Q9Tj6tVwIxpX9WWH
         kELin8/epCLyK4ECOk2dI28R9Negg6x6GCTZpARNHztppqaeZ9Xt4RCWQauvf21m66rK
         rBC+WxE5J3Q4Hoq4At+aAxo8VwemyNBPeJiUl8VtbUwXF3eR9g6g7bpiddcUVyyzDM3n
         kSyOSXgMxqGgI21MntRCXFdUT+PHlY5+i+hygFvLncBWYo7ehXKp2uASf2oPc2VFRURD
         biaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793449224; x=1794054024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6eml6/KMAyx4GGG3XewIb3LC5ArF6kRUP9Bc5QWjbI=;
        b=WHXAoUc3/VNBev9UZ8dkOFucy9R2JdxpNW3semz/6E+WBNyPqdIxHJFs541NZxTPYx
         citVgXJwpXmBPHST7OWueXWSa76NNUSfJ2GERhvc2IeMvgUUBqqToR/2fLB8dywvxuLf
         fMFe/qGpPwmg1jEAbwujk0EpTHbI6okGz9J0mn4S5fEohjZcGWpI3F8m0wq8DvqzYMY+
         9Bact9+OCsQssAa2e5NeksCxrEH1v6jqVnFUNwPFh1guMyByJo0YCs7tbNGnENqUe5H+
         OuYQu6nImQitqHbj10SWWIv65+clWORuhQJea9igh531xfZrLxMB2Q0ev2AS3j8VsYwQ
         EXuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwB0l9SAQxGkmWloCzDH2ROS3+FKwa+Pv0mxkMPcQRhU1y1ifwH+MnlCiH4X4i7+5EPa9gmozk1rUE5QEk2@vger.kernel.org
X-Gm-Message-State: AFq9FYKm0dnkoaEY8zio77FNgP//nd7OS1tAFckVxKE7VhSnYJjPc6pw
	aCJ0Qv+oMXhuYFRKZm3Ktia/H3X4oAVI+AYW3/rl5OrLIAG1uPixXI+EvdFiJHekYzh+lmhvrO8
	XT95iPCLo3vL9hUlbDISebwK99AdRDa086nVrqI32anAEBiaAOXM1mtcsD+QCqnrAh6FcPWlLkF
	YkheM=
X-Gm-Gg: AYBFou2opjdJ2vLHRplCXBb8VrCZb3oBlMGG/84/GHif+rA30SA/SU8EPjVMXarv3G4
	jxoWfVbathSJqiARWIIkdmT86CWwIiKm/JNi+MZ7eLw1fvUV2+BknKMMXDGRWh6Wz+bpA7ywQj5
	nCmS4rddH9eTuYU0L8Iq3qkNNEIfsmQxtql9yFBh6gtsEOYdlRq6jcy4eKUHeyeU5N82WpNBzRQ
	lTBnkNfg8z8rDJIuCiIyE8VLQXPsLVhEUxvPoLzHMRAGQt41SCyTG0S+9eR2tOqn3I+mJur2pWH
	JssZlpStbul2Ei7fUbg2eDEX+9w+7cX2/hwusVATTbILC1H3BciT0ZZkIVph41rtBkkrL7tUmF+
	vNZKg1jRJbTVP3qFtDQBOSZYuiGP4Vco90KcvMwcLm/M9PEm9MNGcqT8csc/qXHVXBLSgxAijzL
	aGHl8mE37vbWWk+UU=
X-Received: by 2002:a05:693c:638f:20b0:36a:15ee:c209 with SMTP id 5a478bee46e88-36a423ec1fbmr7213911eec.23.1793449224033;
        Sat, 31 Oct 2026 05:20:24 -0700 (PDT)
X-Received: by 2002:a05:693c:638f:20b0:36a:15ee:c209 with SMTP id 5a478bee46e88-36a423ec1fbmr7213863eec.23.1793449223250;
        Sat, 31 Oct 2026 05:20:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm18933983eec.15.2026.10.31.05.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:20:22 -0700 (PDT)
Date: Sat, 31 Oct 2026 20:20:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: lemans: Enable
 lemans-sa8255p-ride board support
Message-ID: <auXdADNJMS2mMsuh@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
 <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
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
In-Reply-To: <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX3EEpoU5R/EFk
 EnbRjSfrBvhoeDKcaAm5cZF8aPCq6VZwyg2pS1Fu+CWjRNDjDqPKLS3GcK5A70S68ewBTrAeIle
 Zyt3HZG4bekXe4TQ9Wft5YsJIUyJRuekKcKHzFMk6OtyT65b6VwCzNtV5dFWYajuYakTFq004RK
 BBrP4/YCBrOitd8PEi8VbmHKJlSIbgGHxYsU/kVAcYPfbMfGL3F/p5EEzs6r+3D/JNQ/+1J9qVJ
 fghj+2pMCdWl9XDR8o6NIwVvXT5Sppo8a0lqSbcnIRYkr0+281NmzeXWq+t6p5cylNM3OMNl81m
 3oz+pTWrrC/P7pQ16pc1yeN/amP3v68BlQqCNyHdBTFy5OxdHJ8xS4asmMLqGuFlX1GA1Zbbdpw
 1vQOxmHCWuf4AXclI4QA/xenYoCjdRVlU3MqpyIm+ePf0Ma6LKo/JadDOeE3zmnMpS/9LszgEuW
 8215Nt32rpB2K8NTKzg==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae5dd0d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7v2nZd0nDHYtio1KbugA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0G8FBm39djsGsjYuX4Ox5yU-nWyF6n7i
X-Proofpoint-GUID: 0G8FBm39djsGsjYuX4Ox5yU-nWyF6n7i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX3BnKKJo7EQ/L
 lDPX16zF1h5qh1eF1B82l3EHwvRQzR6rQSL11LAPS4H59E3TTeqswrQjvD4ddB0xUb7/D+y/cUd
 50fVakvwEjU5zPw+WxSTAjo8NT7B/tY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310049

On Tue, Oct 20, 2026 at 02:16:27PM +0200, Konrad Dybcio wrote:
> On 10/15/26 4:37 AM, Shawn Guo wrote:
> > From: Nikunj Kela <quic_nkela@quicinc.com>
> > 
> > Add initial device tree support for the Lemans SA8255P Ride board. Enable
> > UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
> > zones for PMM8654AU sensors, and SCMI protocol nodes.
> > 
> > Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	thermal-zones {
> > +		pmm8654au_0_thermal: pm8255-0-thermal {
> > +			polling-delay-passive = <100>;
> 
> Do we need the polling, is there no interrupt?

Yes, we need polling. The sensors are exposed via the SCMI sensor
protocol, and the SCMI server on SA8255P doesn't seem to support trip
points. Also on the kernel side, scmi-hwmon driver implements only
.get_temp for the thermal zone and doesn't handle trip-point events
either. So polling is the only way to evaluate the trips.

> 
> [...]
> 
> 
> > +&pcie0_ep {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
> > +		    &pcie0_ep_wake_default>;
> > +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> 
> This GPIO reference feels like a layering violation - the previous
> commit promised TLMM is abstracted away

I will reword commit message of patch 5 to clarify that kernel-controlled
TLMM GPIOs are not abstracted by firmware.

Shawn
