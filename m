Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017528;
	b=WvSaDawl9Wn8Q8EjxtmkpvpA5Hl/CaAorxzBK82OeRlc2wZLuyH265OxDSQTAh/fk+OW
	 Gaj/e3I/gbIQG3yGQIr9bplGVv10v1oLkkT2cFQwVL2k4y1PMw66zQcK8ylRlULOB2pGX
	 thxl3UHlnYnH54wkGEB7asChy0Lt5RiEElos4GjbtH9TOoO+Y/vfJ54DRGxN1T5q2uG4V
	 L4NnRl7ZJkjXqnp70t2G+5mOlVCPzr+7WjBReMmbnnZoO872hWRggKUioEhb8xMlrfpbb
	 6eOcNIU7VBlJamelRPghd/yAR9F60pSPKV/NWIiDQ4w3MW9zBz71d9u9Ehyls2RJtpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LqQCtL7DY6GdOgcgju6Yk99vFFUh6YCcWxgQrEusl0c=;
	b=o+gSAiTaQc93N8namg0SePbGaPVzr8/R+LbY7dsirqx409uVlfoaO/t4BoErvfieEt2V
	 oiuE6Ulhyh34a+wu5+872z/AdIbj8gUlJgeiluCc4T7tWFyqFKbMGMz2eHj+A39WZNhOX
	 rPhNeUiV2cKdZXMHDxP+OoIedaBMmfIbjfKaM3B+zUdQFjr1jLwVDWCyBe6WOSPPBTGjH
	 8T4pVeKFypfCg+VnuSXxY+H82ALgHLOAf4O6/joE7mc0ltDA6ErB+L3UAILibDnIT/Mf2
	 mmGJosB4RMrC/cBEWZYekeXEeRY8UM0pZs6gKyMzltw9JW/EGq/Rd3lyiTIP+LZJKzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WN40mK77;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6626A606A326
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 02:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6626A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WN40mK77
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36cad25b8b0so2013100eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 18:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017527; x=1794622327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LqQCtL7DY6GdOgcgju6Yk99vFFUh6YCcWxgQrEusl0c=;
        b=WN40mK77q2MS0NRynvOXOkwBOhjMjS8o5blvaF59gy/8znq9HbxNHxZsG2N1FwWOAO
         pTAuQRf4j6rhw3fT56835TqbRRFGlf/OQ3XNQZH/24t0RcQ8PVTrF64PbPQ1y3uhItZS
         0AIFwC+b6KLahtXWBc/L05PucbM1u78pW1i9Z/K6mqbGrDf5V41efbftNnhbCqtO58zk
         k/1bSUUBNsdi0Vp5tTaO57CUdgE29Uu6dA/R+TbEbxV5nQ4DpIrV2buafwtFjBoOUH8g
         syYT0OEWfsXI/cMn9aePHWmEpAeIyyTaImStZlRs0dwx0NklaqtHGIkst0IwuM8aMobz
         tGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017527; x=1794622327;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqQCtL7DY6GdOgcgju6Yk99vFFUh6YCcWxgQrEusl0c=;
        b=Uk4znWpvtAWPSJ4MDcEHoI0c5Vjcr0rJI8dJWZUbymUxRWsay8GaSxC1oicDZBB0QT
         yc8Wj3BmN+RkC3/BmUNW+QOTmywPwBJsZRHuTQkI426PqSZrVO714+gBRm2UvWGfWrfQ
         QsTXNnhNuL+2xYJR2PgCnWMqfuVZV8vv5EuJq86fi/pl7z9n0h1MYnzL0Ku8o3UsOt0k
         MnYoUOKMDqfE/3bQjfbvcKAcyQLhkbQV8+5bYzR3Rnw09PIW0Wp0ud3UVhmpONOmALyi
         EesIU3mDuwxG5CIhF5wb5lozfBYwkZjdMHXHIoEWuo/GqOn/q1v0BocD1mbfShPrhrRw
         traQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8LxnDlzi0kwr69xfBRuzd4laU4IalXUdD1qAKJpbNEvo4pvSwJme+zezfTDJe81Uo2uRlg6qR3fFbEuGT@vger.kernel.org
X-Gm-Message-State: APuU4Z9CD6gzWZc6iHpKgz4lDmiokkHF4HDmStsnSupB/18rjm9+t0it
	7G+7ClFSkarJomlXsMBBVGnpsyTxiUMqcDum77cRtfCvhUVELirFXtba
X-Gm-Gg: AYBFou0EUGij346fi7+OJ8RvqFcsfwWPW/zcPSRAAk/5u6c/sRVKQr2lJEnRECFPpqK
	gdCi+JH26ZxVuMjE5fwQsAhuMhbb/VJtBt4zt1qgwF+c3V0j+omg/MBN7bRzaXHWT1SyMY3ULi/
	muYPoE2jLs1eTKEZAYL0ufKnDPxui6XyYD4Yj7AcfLEerbyB8gfZPtO0Fjh6S534FOzIP38xS7+
	6ASkCwd1mcsSF7y0wTy4hdOt4NdCrNkvPw5wAefYbCUqiLGZJZzIQFZG79nuUY/UYSDF7pebOHT
	9/Ab07EQH/AQ1Mw806GsZomnlRqC0Y1Yzo5H1KcCh7FyySKxqA/wYdVK35fH+H56S9EIkLYDPm4
	tjLKKGYQAKEfvibpfj85JJ7+a6gH6nb3dTa4j4RkinQLPI/+hS9xLnPzBdeg9bbA3asnNSr8lvk
	RMhQuNBup0zKEIM4FDtJRID52ZDVP633jsO4e86NKzqrrPaNwWX/bqDaf1N0AR8RBEXwTjwBoGF
	ptQkWP5NOLvuhTcO9pv9hz2FHI9dX5VFNSJWwyHdbbFzyYXUshvrcPkSNNQqnbfklTkWC0rRXMC
	yOCCraE377FkeBEjY2vj6KOSO4Rs/M8eqs1TzzNnWMrO
X-Received: by 2002:a05:7301:b0c:b0:36d:c3db:9802 with SMTP id 5a478bee46e88-36f76023a2cmr5537963eec.18.1794017527249;
        Fri, 06 Nov 2026 18:12:07 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9be7077sm10949924eec.17.2026.11.06.18.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:12:06 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Sat,  7 Nov 2026 11:12:08 +0900
Message-ID: <20261107021208.934-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261104-bipedal-supportive-earwig-2aae26@quoll>
References: <20261103135057.1682-1-26rote@gmail.com> <20261103135057.1682-2-26rote@gmail.com> <20261104-bipedal-supportive-earwig-2aae26@quoll>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 04, 2026 at 02:13:21PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 10:50:55PM +0900, Joonhoe Kim wrote:
> > The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
> > DisplayPort pin assignment gives it all four lanes for DisplayPort,
> > while the controller can keep running its USB 2.0 port. The controller
> > has to move to the UTMI clock before that happens, so it needs the
> > Type-C mux state as well. fwnode_typec_mux_get() only matches graph
>
> Controller does not perform the switch, does it?

No, it does not route any signals. It only needs to know the mode: in
pin assignments C and E it selects the UTMI clock as its PIPE clock
before the PHY stops the PIPE clock.

usb-switch.yaml describes mode-switch as "Possible handler of altmode
switching". The WCD939x codec uses it in a similar way: its mux
callback only reports the audio accessory mode to its headset
detection. The codec nodes in sm8650-qrd.dts and sm8750-mtp.dts have
mode-switch.

> > nodes that have the "mode-switch" property, so allow it on the
> > controller node.
>
> So judging by this, you would need to fix fwnode_typec_mux_get() or
> opther driver code, not the binding?

The binding is needed because typec_mux_match() checks this property
before the mux driver has probed (see the comment in typec_mux_match(),
drivers/usb/typec/mux.c). Without that check, any graph neighbour that
is not a mux would make fwnode_typec_mux_get() return -EPROBE_DEFER
forever.

Apple and Rockchip handle this in the PHY driver, because there the PHY
driver can reach the controller-side USB3 control (the Apple PIPE
handler, the Rockchip USB GRF). On Qualcomm the clock
select is in the dwc3 glue (QSCRATCH), so the alternative would be a new
interface for the QMP PHY to notify the controller. I found no existing
one. It would have one advantage: the PHY knows when it actually
switches. I can try that if you prefer it.

> > +  mode-switch: true
>
> Drop, but you might explicitly disallow orientation and retimer, if
> entire solution stays after review.

OK. v3 will keep the usb-switch.yaml reference, drop this line and set
orientation-switch and retimer-switch to false.

Thanks,
Joonhoe Kim
