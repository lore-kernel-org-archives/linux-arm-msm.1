Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776991;
	b=e0APhKVKVTlM1LlAWhqC6a3zGXgXTtyxBMYEpAj+RzOeNa0r2EC+3uZZxqiySvx2Ayj4
	 OIlxtDdccQ1KQm78L0W5uwi3DQEms6sIBq0KtQJLeqybrDuEWEaK5g8T//dc9SsGcOZ6k
	 i/sl8sM7nQsXljlOk/WodoSMscXXM2QajR1Wevzhusn9iLLcKrQA2kgw4aq8JCKHhIswp
	 e6FWC0wke6kZXd8ecXhB+OTbsNhZSlGR+CzD3tBsf2/wOcy8gq+PsMnXoY1//Ya+Y17Fh
	 +QvGd3HqA6XumSmiK3jA2eeQJt4WZf8JrOgUJ4FxsHtuvMgGqN0/uf7spG6Z+/pyfYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=;
	b=zvc+CfRvcRZd36cx+2UxJ2HHf6qdNHannhpqGCZy4eIhuZDTS8vyUivFwVs7/EdkYZnQ
	 E95/VbWlexYdQJmbpHKMwn5Y0Liz2D5ZUpRIj+EsYm3PnB5GcA7kXrp7fCv02x/9HfCFZ
	 eA2yPYP6rMMeJ8AU36q5vYvePC4eUnH9FrR0Eu8XSNmM5HkunW45xejdNPu21C+AyBu37
	 GxGcyZCnqqzKS9LgBqb/3j8GiE5qnrVbsYcybpDnGLKO/Tv3JUXdsZ8BfBImWx4/K5EP8
	 4JR+WWssTKi0IcLJM4KH1aj/a7DrtqnkeHI1oPixpQ4qnJG+bzgPxw1Ms/sdiPz8PQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxFWYs+h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwd8xnlg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84578606A329
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84578606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxFWYs+h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwd8xnlg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApBNN2677177
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=; b=nxFWYs+hbj2oVrEG
	DjiO7+devEYg6Y0GUa8g9P6GUlJuqEV8JitG8WUQyqYsqp7C5DeQwg+YP8qUqPFg
	m8a5+VsIKUocm9xrF5cm9e1qXJAAGsmQC4NagCy0lnktbaDj70C0fuA2QpafWxtN
	j8wKbujzCjI9YcHtt2gvvoSGJmcdeASMXqCMRLzFng79Ekq1iD+wx72Ar6LTu0Yv
	S7oskl2VOIyqiY0BBl+sRAisP1RjEJxBTiyL9xIP0j1qAuFrO5pJYlha0H64khs8
	3N9CaSHL5wjXwbO4lPLxwlXYvyGr5ENMcaMctq4rxQn2Y3/cRIjXjpaZhD0f1z6u
	noZXFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh92px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:56:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949664eec1fso96533985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795776989; x=1796381789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=;
        b=fwd8xnlgMkfHaudynmDKzSndgVVYISR0kXA5SjCRodZrpSPJ+1ukeSEP942bGUHdSZ
         h2qjKRAV05rFyY9j0+hCwOGfddnPfRMaEbBSM8RXq+YwS68hS01vE23gtqFlmroO7+pa
         6RKWl+6chVWG4hXeAmCWh9lomTJ1mm3ZYcmFOI+d3/xsreUUamUtrFrAveDvD8XTLKST
         8VNfEx7s//OA8uMG7ZuZsJwAb6eVObcIDa2jfATeHTJKOLfmeklQAorjfNWQAVbQ8NvJ
         QMIv+GLNudGyXRPNE1x78xEI09tWVG13qXOQTeiXtP1C0wLgt9H7w+Gkor6r+eXBHNE7
         sI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776989; x=1796381789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=;
        b=Kp/19ra5L/BTL+Ja/NW1v/lP1pVMkT8FNZxfqIRNe3RnV3DMpfx2mV2D9vwAQVOkht
         61zWXp8hOXCL53SLbGS5zPTJypq4jqYsGCegD+ZxRBltzdzwqwunncoYzBV5p4Okkgh9
         e1JXUisOxRqUvvHbbPTaIG9AxVVk76c32ED84jAZ9yLhbla3VuIvBuXRld97gWgR2upH
         6lDwDkjip0UJAOv6tgBugI/WY4YvrFszOZ1ZdkPKexkzItUJQhMXwZa/3J/6rHbBhlOi
         loKkODBdSI9D0vVGHuXIaaLWC2F3UNJtk+tZc9ipDSVrk2u4LfWjTFuqzmPAeHcrEcIa
         A0Sw==
X-Forwarded-Encrypted: i=1; AL+hErGsz7jfsKcn0WvX/F5Pl8rJbfrvWtVbfhzzunM5dMRkIYAbH6mbz0w2owwJ60uDOZUbyj1ZLZYc8F6Nk8y/@vger.kernel.org
X-Gm-Message-State: APuU4Z/O/Bc06tP8eEl9uBvkggJ66f03J6apIuk5Tc6CqvtMSd3qRzuy
	X4iRGycZRT4I7lneLyOu4SImm1U67EDpyQzGGNClt67Z0mThXkSF9pqnrBF9OpflegX/N16OwT3
	sI+i4dFkl4CvOSho+5011vgao623IVmfjnFoZ+FxxdZU0Y9bj6BzHVfj/8a3ecoQtraw5
X-Gm-Gg: AZFdTZdhqooUt/1LHT1x/8jNXwWWTtFOUgSRgI7YyJs5SqcZNH/xn7s5jPtW+DY3u/F
	r+Sx4m8VFd/yDeFRDis3GQ9uzD7CZuCwXlog5SkG+o86nEnAbcecvckFI64j1wx2dH2pXhg9clL
	pdJjoXYX+2SioWd8PW+EwNoHRsZPbCpTnzOpIj46oqV6rWi1mklomosN/OOc71+tzqILGhqz5R3
	+3igVss7hZb5MHD/Y1pyVSh+YmoYO+P4Dz+RE55sXVVCTsbRkmCZHoLazG9JvK5DTWHfNiiCP6w
	Z617LRzj46t5G17AY3BLxM29BN1drVMn5KRHPptNWQPtm0uzZRIA6ZnpvGhz/lwakEcBHk1JCt8
	b1GNHoVTEAVXv5LZh9qgYSeHksOpndC9hsJk3F+MoJHnYRyOzpDDPaU98Q4ep5Yf2PHZvImY=
X-Received: by 2002:a05:620a:6587:b0:94a:26da:35aa with SMTP id af79cd13be357-94a26da3683mr69441385a.3.1795776988567;
        Fri, 27 Nov 2026 02:56:28 -0800 (PST)
X-Received: by 2002:a05:620a:6587:b0:94a:26da:35aa with SMTP id af79cd13be357-94a26da3683mr69439085a.3.1795776988148;
        Fri, 27 Nov 2026 02:56:28 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb07844211sm4492470a12.6.2026.11.27.02.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:56:27 -0800 (PST)
Message-ID: <92f6d14f-1f81-4605-806d-57c13e30126d@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:56:25 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: mahua: add iris video codec node
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
 <20261123-mahua_iris_enable-v2-3-b1a16b16afca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-mahua_iris_enable-v2-3-b1a16b16afca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfXzhFS7ZMPMB6Z
 lEzfTrSivAEG5OojsELNiwIWvD+6ahMAtArn1Hw5soDUmglsC8pf6vl3uq10BOpF967t0AQ2LpN
 /zjxGnoJysjkBVEgkbkF2a0aDY6yQiE=
X-Proofpoint-GUID: 56zXTU4f7VmvI3UYdxqLzCDr85vMQChn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfX2VwP+A12ZQrg
 EAQg5IEs9WvUszd1H1V0c5lPmh8QqiMbJW9qWg7LF0KQVloP7fuPm79ir5lDAKoqx5u1ABZ+GMt
 Dx3l5Ohd5uOvGnE3IMzTujK5nGvMlkL+tCWp9szJh3bx6XuX2ONPpToVEbU0+3CIA/4dKwcQSfY
 lxFRfTTuXB02FFlRZC29t62kkU2ehiSy/A0NwLBgqSiPbhMG7HOpd7pKvraV29jsI967MbSjrci
 kEPDpxeLjVBqtGl36QSZnXbwo6BkUVy2yU8+cCuqXCSyvRJKkYUEB/cqta8krnt4cCqO+mW4hVu
 OO9Hxv4JxL00D16E1pPj2bBeDKUx0H+pKp6yg+nAcva7QXNkHMpwgbvNiXlzlcEt7zfhnXwGQXs
 HjClja+xp03Bid7Cesc6VOmjTsNgAj+eUWZg9dKu5JCxuvURWnCJ2L1szDyMnH5g22AI8wTL4cZ
 lBrgcUFrF4asCdhZ3WQ==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0961dd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3aXJPGk6cDIRbk3RZP8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 56zXTU4f7VmvI3UYdxqLzCDr85vMQChn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270043

On 11/24/26 7:44 AM, Deepa Guthyappa Madivalara wrote:
> Add the iris video codec device node for the mahua SoC, overrriding the
> fields clocks, power-domains, resets and opp-table reflecting single core.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---

The glymur series is not yet merged and can't be because of
dependencies, so this patch can't be applied either

>  arch/arm64/boot/dts/qcom/mahua.dtsi | 67 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
> index e7141f8c9e0d372aa30f2ac1ecdc5941d249311d..4f018193be50a9f62bd9b0b403a5a6b0a9f6b6a5 100644
> --- a/arch/arm64/boot/dts/qcom/mahua.dtsi
> +++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
> @@ -150,6 +150,73 @@ &hsc_noc {
>  	compatible = "qcom,mahua-hscnoc";
>  };
>  
> +&iris {
> +	compatible = "qcom,mahua-iris";
> +	status = "okay";

This is stray



> +
> +	clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_CLK>,
> +		 <&gcc GCC_VIDEO_AXI0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
> +	clock-names = "core_iface", "core", "vcodec0_core",
> +		      "vcodec0_iface", "core_freerun",
> +		      "vcodec0_core_freerun";

Please match the style in the glymur submission

Konrad
> +
> +	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +			<&videocc VIDEO_CC_MVS0_GDSC>,
> +			<&rpmhpd RPMHPD_MXC>,
> +			<&rpmhpd RPMHPD_MMCX>;
> +	power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
> +
> +	resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
> +		 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> +		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
> +	reset-names = "core_bus", "vcodec0_bus", "core", "vcodec0_core";
> +
> +	iris_opp_table: opp-table {

You need to delete-node on the Glymur table, otherwise this shadows over
that one

Konrad
