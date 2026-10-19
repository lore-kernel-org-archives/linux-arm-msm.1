Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448622;
	b=RBbjUaPXMR5i0jRrUv4ThLzT+/1THnWaK9mLxMcjOJLjFAlTgjo/hD6tTG9Tp/lw9o7n
	 Zm1g7BZRdurKQtE20x3cseuhE5D4kSaTv1EVDxW6vTGbwGKMKNrmYXJul7vNCoMVmnblS
	 0O4Kw7Yxc/tE7Z5Fvhix31tyh+7JJNWEoKYMWwL5r/d0QtMwFMIuc/dUNMaHb2BNEOsCo
	 QHMGTnvH4o1eNWtJHkvfiQ2RxadlIEtxcOpgQg2PnI908hI15DVQSprn3a9X36b2fCcDK
	 jDPwJqkHKAG0hzUPVtKzR8hWLeeoVn9HChr2bwA85l42twz+7potvD3BTTd7kWSCWtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448622;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=USQtrcdyhKNaGhzibqLvfNZ+j6mKmvxo61o+NFYHEyQ=;
	b=x8MQyteSHSM+OOcXU+nS5VecnaxvxHHsHg1A5/nxavxKqpPxjda2CksiVygKiPAdKt5v
	 hOTCEIk2ilgs8PajymHJWqlCswjEyJvvfKL+pz7XXDOBCbLygASNkVmAya1XOTCCXK3U9
	 WkeBA2hS590cw7zSAKHNRheM2GlB10hm1rXp3GgOQa4zBjrO+jXG1lXtd3t2lZD3ZwND1
	 rlvs3Tl+4RvD6ZznckysdVaRH9L1/jP0oaHcrkgWa8npDD1B2C6m0MCXPiSUhQsQB+Qo+
	 LzWk1EoZdFD8XcxVEh9+Z+P+K0b+Fm3SpA8W3twBROJHU6zFaZ8S+Sut/UrHCDQOtiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOyG8FNL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3Ch11jV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1A1606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 22:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E1A1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOyG8FNL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3Ch11jV
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZf4C282809
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 22:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=USQtrcdyhKNaGhzibqLvfNZ+
	j6mKmvxo61o+NFYHEyQ=; b=MOyG8FNLdkS0Bbku7VH4ETh2pCTkCzyCkkWzZB8l
	0FCqOw1AqQOaSFp50KSRa5tW4dSwmgVbYPN0rMsqBDSnqYC1/3yYUFzFdmwzY5Se
	BItn7HP7rNqabDAl+PZz2HXugJGtHwne6GxBine9emJQ1wKhTW/eO+9hsyuouCHS
	+yFYL9ScyQw6wGX+9ognJ1Gy0DO2+ePmY3N5X3aQzGUgbH8fqJk3td7KxYMWW3Qh
	WI7XA5ojY1EIHMpzRzWWjgV41SeJgNgswMKPtRGJQHgILDS5aiAYpdHx2l45nJns
	ik1ygQbqKV5xTeoQoKkGyGyTN64570Iuzgx9IOUmuHEzXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48kes5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 22:23:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so801303085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 15:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792448620; x=1793053420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=USQtrcdyhKNaGhzibqLvfNZ+j6mKmvxo61o+NFYHEyQ=;
        b=G3Ch11jVMYTumPM2Je6+cRZCSheOmVMh6AqdOMwUdbwxlZCYxLTwoT+ZEKHuZvAXvC
         OOquaUMAhpLpZ+0JytryzB+Q4e+nNKpvVTQQDm47/6IaIbM9y+4b0GIB+QInnqFC95Iq
         l5iZ14bTock+BFMHlUy8jbBMS3AmpgopsicOS6LA99N97hP+W1BKR9K63GZTloq6wCsb
         k19vRRG7Yy4e+lrFd1Au82JbAvzYQYTwrr4qqx61XJfaXbPIpxanLeqsmt7wf/iaLcb2
         wFrKBbtq8LnPD6rCUoWH/xNpNvDPvnW0oCT2DR+jpiIM4ZgNMFRXgmG2yA//9ncbVUkg
         R+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448620; x=1793053420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=USQtrcdyhKNaGhzibqLvfNZ+j6mKmvxo61o+NFYHEyQ=;
        b=E0zkMN65FcRvtaYgkFR83keUX1/qziNuGccz7GZuoodFfyI7+A9FxJgo1kcB6JEwfg
         YbScdwh7wmGM2K3k7R7S4vwnaCR8JhBUswRUd5ShsGmfw+/HRN4Z5CIKAD6qJk7hAlNt
         4foLJcTASOjD2uSh6Z11XcTL9YQOzqD0TnMfRrETb4QInlCEnGC7kbg6tIFXDLiedL+P
         YYOuatc2r8ZJWGcRAIZb5fOEau/8znZSph3s2QnNy1nZMVWd1da23rkpDvpedGdIEv+s
         dKB9wZHw3LktISPVXnXB5O15DZW74yCHhg16sziQBhSOqgrfNNagsOF83gB9+D3YujLw
         6Yww==
X-Gm-Message-State: AFq9FYICZ3/u1G2O1fz5NoUqulWX8Ym02C9mWnhOu0qxT9ZG6BT4zk/g
	wvuZMOTnxtSVFISXqXRV29+3Pj9YRR8vVCvBDsSnva6JXVl6pyw2d70JfujyO6aCknWBGAOL0Vi
	OLmVfNa+PAgnQqs7Lb6GVTjhgAtTMvVHD9SaZvqhzRMnD8qBHo5Y/s+P3WfauDhTlyHtp
X-Gm-Gg: AYBFou0/bWfDyp6VZZ/a0TR1lQuc9UhH3/SecYrmJ8YF/JewVjLnq0hGEXMfmslUjBj
	zvCl8ZO7arcD4kP4u/OFPL+wmKSTU4sBRJvn+nLEruFAmSdyvGP9yxlxLLaRPhzWk7/Utvb4o4M
	DBCKHKJo/WQpDUg40ihc9vp6SASr/kFfO4Huv4V8EjNJjfPakbN2jTCqtxFWCufNtDVEGI/+d5J
	AzHhwcFknEFwASlVxbKuuXzGpmQiQJmTXeU7f74rJALtwp7lvteERKkXyxODgoyMdLjqJfacn1W
	K2feJvOXEYDKZ1HQUJpu9r1OyWot0q7fDnoRLK1jJtkafXHgSbzqyoT8+MqRzAOYaze4ZzTwsiz
	BmF9wcBi2qPnqZOLprihaUHeR0ttoWBYMYpjPFzgRwniQiTk1faYC1EyoYIyr7r4Op7CXOTnhNs
	Uxzm+fawo5JNQs
X-Received: by 2002:a05:620a:4456:b0:93c:5951:38e9 with SMTP id af79cd13be357-93f29d5e01dmr1497003885a.52.1792448619787;
        Mon, 19 Oct 2026 15:23:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4456:b0:93c:5951:38e9 with SMTP id af79cd13be357-93f29d5e01dmr1496999585a.52.1792448619273;
        Mon, 19 Oct 2026 15:23:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a3fd03dsm2279048e87.11.2026.10.19.15.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 15:23:37 -0700 (PDT)
Date: Tue, 20 Oct 2026 01:23:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
Message-ID: <3g6yjybhsqzedb7q3ygpf3ej3btyap6y3dqpqcnh7ghhwduwre@gzl2kqc4o4x7>
References: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
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
In-Reply-To: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4OSBTYWx0ZWRfX83kmWGq4oeto
 VrJIuZciQGjAECILJj2V/Cr/QC9WctPklICWhwAq/HJ01dtFtrju7Ccvi0pqsIYdp0AwYUMfWBz
 ItoYV52OTnV8wbHCqvluaJUnucc22XCWAel8+OsWmGwib4n+0lxiw5yTHm1t1pkGWN7s4vIHr7i
 n94qyhR3o7AE9f2JKWWPHuXWDXEp+1nwOCYgjZv+J9JVu99h4QuQabsfwLGThau86MvT3Z0oW2l
 A4CGVoSq8h3vhxtIILx+DhchSPirq/+Ehdl9JEBHPVCIzRMa4Y+Xkrl08K3s7juO/rUU5Up7YDI
 efQd7FlPC0QfJGaFgLid3RoxXXcLZk6h6hKrhUIVsFuPilQH7pvePZOaek3CEGyIENPAXUvt2h2
 1zhOWbbg2rgZX/2LCOEjteIHCy/50nhLqvwwW49KpV6gauncpOKi6ErFXG1NMKLc64grt0QM/bD
 rVcMjkUjIvBLh4bc5/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4OSBTYWx0ZWRfX54oV22ZGcPmB
 7sFbRnK3kfjE1hldWoMWhNWumSD0o9Jy5sVuCLuun4HCW3dBDoOi6JfcLV/3zkihSQu853J5O9F
 rL4343sXtcAgwTGAKQckZtAmYDiz8/4=
X-Proofpoint-ORIG-GUID: qUbR0XT-OVPVnJ4fQiycwUiesObseeRI
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad6986c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=ajiliMmGaEjDzu8pHK0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: qUbR0XT-OVPVnJ4fQiycwUiesObseeRI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190089

On Mon, Oct 19, 2026 at 05:30:08PM +0300, Dmitry Baryshkov wrote:
> Probing the ADV7535 HDMI bridge fails on the IFC6560:
> 
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ
> 
> The bridge's interrupt line is PM660L GPIO11, but the board never
> configures that pad. pmic_gpio_populate() reads back the state left by
> the bootloader, which is PMIC_GPIO_MODE_DIGITAL_OUTPUT, so
> pmic_gpio_get_direction() reports GPIO_LINE_DIRECTION_OUT and
> gpiochip_lock_as_irq() refuses the line. Requesting the interrupt then
> fails and the bridge does not probe.
> 
> Add a default pinctrl state switching the pad to digital input, applied
> by pinctrl_bind_pins() before the driver requests the interrupt. The
> ADV7535 INT pin is open-drain and pulled up on the board, so leave the
> internal bias disabled.
> 
> Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Dropped extra empty line (Konrad)
> - Added a note about pull-up for the IRQ line present on the PCB.
> - Link to v1: https://patch.msgid.link/20260920-ifc6560-adv-v1-1-89b1435d00c2@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
Other than Sashiko's mention of output-disable, I'd also need to correct
the PMIC that provides a GPIO, so there will be a v3.

-- 
With best wishes
Dmitry
