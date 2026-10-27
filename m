Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109004;
	b=UhC8OcBnEj83QaBe3CPnhLEB6uNrqqiQQj0uyhgssO7nQJT583jdl9wTeDs75iH95vAo
	 15NUXi3dv4WVAe8s0hQi+iv0VTlKiNlqV8vkWl/bEfEB4f8Tlqc/9u7QaVa4GrQ2Wc4+B
	 MMRob8JtMKx0C7aNbOfkCq2ihI9v75leOo6kMusexSohENOWDc+3BGIkIXWBUuBqUQLYq
	 yU3g5+jD8mUHdWABnEzmoNe8EwB3ny4dufMIX+um7pWHlkrceRz8Tt7jLIVrQTMJDEbD1
	 Qa8TS5L2gGGufWSQcSETx32/29mmpMeLZmCSLhZvl632/BvA/k9JxkxdtPcQjAx5j/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3fcJsJrwZVJpubHjDh5HTiiaoxTH17N3RP/rmPOz5xY=;
	b=XUDt+y1HtNqE2cHrCKEcCVZfWqfD1iIi/Z7OVMlQwuohSamt0VTn/P7hglDkWQOT2KPp
	 HgCtYLALZ9N10oTuRkXRwx1I+gsHUter/MhQt79rRE6/fiL4R7U3goZIq5x3rURODXdw4
	 +vAJnKyPOKtrIkA4ffwzR8ZFBL3eBWuFQj29D3k6KZwVV5h4L6m/ldiTVgEsc7bepWcmS
	 HJL5GUjePvC7cmoHxubN1YW0giOeLTK/eiK+3WQMUd/OWB0IJZ/1Y+cc6TtijNGJLLHJx
	 AEVj/AK7hirZOKsStMuwE67/n/Lv0vACe7SwObpA1ejMhp/nci7SFoVgWMfUNF8IU7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDTkuBxG;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A508606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A508606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDTkuBxG
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e63ee7b4cso521643985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109003; x=1793713803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3fcJsJrwZVJpubHjDh5HTiiaoxTH17N3RP/rmPOz5xY=;
        b=gDTkuBxG9wEyZA26EZszhG9Uh/3rX/19W0sqMYQTMrJDaJUmzcVQj8Q5vsjyJxkhrZ
         ej191n5HdezQNZoWYNpWjnSH87R+ugN3VQYeIPp/zC32VuxNyAMnkNWAKDZgLSlOh8WE
         RdAuF+Zg1uwYuVkS8mWy1z80DBLeT2FyCRuFH1gvw0MbLw1U4udivwWLPpPvGFR2Sn7G
         NkXmzdCN/4KlmwzL0WafjR6fS4/vKwQlYLNnxgh5F4QV7qFrZioFlDVVQ2/1mLd/v99A
         vLdxmNi1B8dVQTg+3RTCB2njXv82jd1gXawVzEov8pDFcu7Boxi03mj5uhtfxinaBtPu
         kBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109003; x=1793713803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fcJsJrwZVJpubHjDh5HTiiaoxTH17N3RP/rmPOz5xY=;
        b=txr6CJNgasoP9Fl+8csNhHemHXdiex3jpRHKabe0kOkRWOCY+8EvoUjMtihuiEyzVN
         n27efKGbhcpBViPh8fycIo9lXKnhDnc2fQ2RzHoY+H1iT1zbtfALRvAGRryuH+ZrgLyu
         WISd0DcVyA8cGzLIckJMSBxqTGRzcksqtSjAGs5E5VWwABIyY8GWC1oYsmx1/jzjJVRt
         rO0VFNMIVUGE9+NkUqxtU3Vei1IWYnXLDbmdqr0DRfTFyr1IqDLCxsCgvqpHWfwxMdC6
         /UGruAqRVLpfNGA+E4oofxPKS3k7GwM/63p8+wGTsfqS8kpyPOv+u2+2qOOuMTUz/m2Q
         6lBA==
X-Forwarded-Encrypted: i=1; AKwUvBzFOswEd34VxrY/ekF1Z79jPoWzl4yfGOLxbTyHlUpBzwuK18xTdOh0S7BHhOZhzmVA9EimtVQVf5eokza8@vger.kernel.org
X-Gm-Message-State: AFq9FYLaSckhRLt6euFuHgTsHc40aIE2MfUkb5C8e8qr2zLEcIM4Nkz5
	ciq9B/CRt0zrxXntoruXAPZpXiRzMadau3/MBdRdGCB3aueQKGZW4JKQ
X-Gm-Gg: AYBFou3QarM8ysAzGpwUnOQNp/mpg7qAAYfsw+vlLp2aPiH1mAex4mQ1Ds6JjdfXN8Q
	OOX9FgeY39242d5pVmO+SOVYKrsQ+e0W2FXxCv4YPBjY96utTo3ja2RCXjiSdFIj4F5lZ46hfkz
	2E5bVMZI6eFXF/l7CBQDea2mi8IUsQdXBfwhn/SqgJY9dvDaEUc1MFKFSyW44PVltFne/cJ41cQ
	qVtrVl8rGFzgzJ9FWxbB/oymA1Lgf2ug8U+cXz2H6xQ5/LuEf0Bly0A1OX82eGPFs6w8ejAibGp
	Px35m2weTkJsaNCRV/QMDfHHfMtx0JNYcfLfGMRDxC+8+IH7WUqDfNb4E7pZZYD7+/bP57PjAJx
	GURolmuPvR5pRo/8PQ4CGXgOSb2hFiknzbDmsC8iS2NQd2/75/Uarr6nhAQLSKRiPhE8dPntN0a
	ig1lTVksjJEtp5Wf7V4mWEgb33KYf+AHvCNqwc18LPSDrh4/vKwW3tGuHSdaEdnezGavcVEU7/9
	90UuZ2zgYWBcr7lzEsYNfJ2BlImOy9ewk9KG2JyFfhlSmgMVYJabr8pRw==
X-Received: by 2002:a05:620a:4152:b0:93f:565f:e40 with SMTP id af79cd13be357-940ef98bebbmr1567887685a.65.1793109002941;
        Tue, 27 Oct 2026 06:50:02 -0700 (PDT)
Received: from localhost ([141.117.117.39])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05b1adbsm978781885a.4.2026.10.27.06.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:50:02 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:50:00 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
Message-ID: <auCsCPL7gK2lIR5q@rdacayan>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
 <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>
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
In-Reply-To: <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>

On Tue, Oct 20, 2026 at 12:37:36AM +0300, Dmitry Baryshkov wrote:
> On Sat, Oct 03, 2026 at 01:56:55PM -0400, Richard Acayan wrote:
> > The Audio DSP (Digital Signal Processor) is responsible for audio and
> > sensors on SDM670. Add this, along with the SMP2P nodes used to
> > communicate with it.
> > 
> > The sleep state is included to prevent the following crash:
> > 
> >     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> > 
> > Otherwise, it is unused.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
> >  1 file changed, 168 insertions(+)
> > 
> > @@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
> >  			#freq-domain-cells = <1>;
> >  		};
> >  
> > +		adsp_pas: remoteproc@62400000 {
> > +			compatible = "qcom,sdm670-adsp-pas";
> 
> Looking at your DT schema... Can we use "qcom,sdm845-adsp-pas" as a
> fallback here? Then you can drop a driver part.

Actually, looking at downstream, this should use the LCX power domain.
Can power domains be omitted like on SDM845, or is LCX important enough?
