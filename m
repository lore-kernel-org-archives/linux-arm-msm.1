Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483635;
	b=pN/Tvgw0C/QS/1WNNqxv45D6n6ntw/qTiOgr6xd1jmTxNsMqIEMBazyN05MiMHLwJRvY
	 sUu5xCgFmtb1WS4iJzPjdeWSqKRimC9N0OC0RtoINh1fCAmLKO4OGM+w8vbsbJM9+ZY0f
	 MBtbQ4sprm5vUDBcWVp9SdkgKsH6h/lAhU7IvcDC0PDhFffGJB1L1asBGj1G04OdApchN
	 a8CRkptxTvuCxWzsPqfHvfEoPRdbQcm03aMzaaG6v8rtz0eW3zSj0bAjin6AP14R8odXw
	 BS9sDYnA0mCESsOMObQJmauVgI+a0+snzR7q1++sqKH3WH31upNVSzXyYhUau069sFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gsyHZxqCFC3P+dq4T8RF1a2PV5Q4RTtu+8pGfoK5wSY=;
	b=24dIS+UmUgxDYJLztNSKSWpM4AjfRQcqwZ7v/ztLkhvXsokgWhNo5qBLwyvhgr0lyNGL
	 rCXRdy0++lQGWxmf3RX2NJHfcCSzqHMeRyNlGNuyv2ceefVBkG8NdpFATxPidr9jduCQu
	 TFfiB5Tid4wDtmNETxWtOmqTpFwOdSt6QduED2mRT3f8DC9a6++JSEkHr4Vd6tiIZmqlR
	 lIV6nkooSFPoiYjyKl0G9cNtLLCFdARiPBZ3AHFU1QOIOqp9IyAPjwoxUBWldlrO86/MG
	 Dx9zOVqBlOLn8S7giRjfdZKArp5W2ZF5zZ+JZOxK5c272IpKBBcYplUT1fB1bqwhmwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tge4VMtg;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0D9606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE0D9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tge4VMtg
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3712b6d9843so4046809eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483634; x=1795088434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gsyHZxqCFC3P+dq4T8RF1a2PV5Q4RTtu+8pGfoK5wSY=;
        b=Tge4VMtgjclRf+pzqJS5ekHgrHrSCeLOgPSO3I999bp75xcBC8b3SPuoO4TVQt9GeY
         6Se59I35oN6hfE9b5PLhIee2YiKtCwceIWizMYngrlh7z9vW3d7YavPI8yX4AebaEZ0P
         fWAB8trYbj0Fflmm3fLqp5E7+zLtbrlg1qmk3/kXZmrz9LSvVdFexcJv5nGVaqC+1DdC
         N1yjB4y5etDTAi5yPr4dyF9bo1YYiLge3oXQeDooNIPtCXIFY8Nws3bpcE4aFuLbLBfd
         qXxh88iCWKoA2uwCJN3RKMRRZ3++I4a+COuyC9whueEG4CmGqfByH/mAk9dGAeIU1d63
         WqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483634; x=1795088434;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsyHZxqCFC3P+dq4T8RF1a2PV5Q4RTtu+8pGfoK5wSY=;
        b=vdrapempba9i4LE09YmnQnB6/2zRIzA37GNsKil1cIurVq7L+Plt8u3NysfSfLV2Wd
         ppPOk4OXE2ROOgDeeKU3IPxV2izEQ4nvbNMe0EhjE1cm3KmZnxDowUvZf0GqrcKlYNa2
         OFRlNJIDpmUdEuCjug0nc6LP9sVBDk1hdKc7n0d/ooQDfNdaVRVCt29EJz47pRqzEnbm
         vtogI/Y7xCShVNHH1RCMooeWb8UbnbbrmsFwOD2gWka77lkbFheG3tjkBY3RtAvPbOwI
         uB2E4SeqVgp/u7vOZgpvldvf40ZESylufwpW13hmcmiwDrr/DCpKBzK1uKt+Hp6fpXB9
         S+9A==
X-Forwarded-Encrypted: i=1; AL+hErGkx4d73qQf15VvFvuVayJCfBhWlTGzSZLTGdE4X+g61LpnjtaDhVqxcLXRXv5VuZ6uQCRrN45AnPluATGm@vger.kernel.org
X-Gm-Message-State: APuU4Z8gDJ9I5H4d4dgNAFpSoTXvJnPITnXy9NJ/yIYS0b/VoJ96V/fq
	Q/CP2WlV9+PVbY86iJVA3xgu36LfS1vPI8m0uD1tth01ph7RIXFhYBph
X-Gm-Gg: AYBFou2WjNzVX75o+AnRHt1BW0xSnfZ7DLWIpJeM48uxzBr3Mm7xcoKNx8Ejy96zvDV
	0Iy6xQeP45bQhr0791Sd2F/eNF2A8jRA3DOkpmQeHqFHDJLN9+9CtsNzZyGqWQJlXxZkzSs6K7l
	Af5OLutrWth5DkotQRNdGTP+FxRydLwWfbNljbTOWeENl23sNZhg0mmX1Hz7FC0crAYIU5v9taL
	9y7OKdUY2EHGbObmRABG4EjiPYlY9zjM3loeeH3WgCzfTbTOqwgMCnsOAy0EE+tbcVBgJS4VQgV
	KisSkasTbawWfjALUC+V2WAO9GEaQ/DxopVTFxkMRUMqlfM5q/hi6fvWQ8OWoCYnFmzdwQUkqR7
	rhD0N2l6/Oyr6YpIEfGcPu4MSyJ+Rc3TAN01S/VRElB8c2Bh2vVj19DYxWnQwtdoLekm5y/RHOU
	kdBKdrLLAxCehLWSzL9k0Y7ZoRHFsqGQHnIzyvFgUHyZmvbeM0zTNUqOu48Be9/p0G7Cdn2Iqw2
	uSjp/wIXIByDHFxrLMed3ll6Dfx2fV993x9tJcXRfxTjIFekO9UIBF/6V+dNGKMe9D5iRdhCFDY
	oNyonGeRHViEID22sHz5xBXYGhox4N9Df602HfajMw==
X-Received: by 2002:a05:693c:8344:b0:369:535f:4d12 with SMTP id 5a478bee46e88-37683188720mr4399109eec.3.1794483633595;
        Thu, 12 Nov 2026 03:40:33 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23450944eec.9.2026.11.12.03.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:33 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Thu, 12 Nov 2026 20:40:31 +0900
Message-ID: <20261112114031.126-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <avUU-99gu3YbNA0g@vbox>
References: <20261103135057.1682-1-26rote@gmail.com> <avUU-99gu3YbNA0g@vbox>
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

On Thu, Nov 12, 2026 at 01:23:30AM +0000, Thinh Nguyen wrote:
> Can you address Sashiko's review comments?

Yes. I replied to both reviews, and v3 addresses them:

- patch 2: https://lore.kernel.org/all/20261112113958.166-1-26rote@gmail.com/
- patch 3: https://lore.kernel.org/all/20261112114004.182-1-26rote@gmail.com/
- v3: https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
